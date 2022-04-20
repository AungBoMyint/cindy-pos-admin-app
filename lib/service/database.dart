import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

import '../constant/constant.dart';
import '../data/constant.dart';
import '../model/pos/coupon.dart';
import '../model/purchase.dart';
import '../model/purchase_item.dart';

class Database {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> watch(String collectionPath) =>
      _firebaseFirestore.collection(collectionPath).snapshots();

  Stream<QuerySnapshot<Map<String, dynamic>>> watchOrder(
          String collectionPath) =>
      _firebaseFirestore
          .collection(collectionPath)
          .orderBy('dateTime', descending: true)
          .snapshots();

  Stream<QuerySnapshot<Map<String, dynamic>>> watchCoupon(
          String collectionPath) =>
      _firebaseFirestore
          .collection(collectionPath)
          .orderBy('expireDate', descending: true)
          .snapshots();        

  Future<DocumentSnapshot<Map<String, dynamic>>> read(
    String collectionPath, {
    String? path,
  }) =>
      _firebaseFirestore.collection(collectionPath).doc(path).get();

  Future<void> write(
    String collectionPath, {
    String? path,
    required Map<String, dynamic> data,
  }) =>
      _firebaseFirestore.collection(collectionPath).doc(path).set(data);

  //Write PurchaseData
  Future<void> writePurchaseData(PurchaseModel model) async {
    if (!(model.bankSlipImage == null)) {
      final file = File(model.bankSlipImage!);
      debugPrint("**************${model.bankSlipImage!}");
      try {
        await _firebaseStorage
            .ref()
            .child("bankSlip/${Uuid().v1()}")
            .putFile(file)
            .then((snapshot) async {
          await snapshot.ref.getDownloadURL().then((value) async {
            final purchaseModel = model.copyWith(bankSlipImage: value).toJson();
            //Then we set this user into Firestore
            await _firebaseFirestore
                .collection(purchaseCollection)
                .doc(model.id) //TODO: I CHANGE DOCUMENT ID
                .set(purchaseModel).then((value) async{
                   //UPDATEREMAINQUANTITY
          for (var item in model.items) {
            await updateRemainQuantity(item);
            await updateTotalForDaily(item);
            await updateTotalForMonthly(item);
          }
                });
          });
        });
      } on FirebaseException catch (e) {
        debugPrint("*******Image Upload Error $e******");
      }
    }
    /**Else */
    else {
      try {
        _firebaseFirestore
            .collection(purchaseCollection)
            .doc()
            .set(model.toJson())
            .then((value) async{
               //UPDATEREMAINQUANTITY
          for (var item in model.items) {
            await updateRemainQuantity(item);
            await updateTotalForDaily(item);
            await updateTotalForMonthly(item);
          }
            });
      } catch (e) {
        debugPrint("****************PurchseSubmitError $e*************");
      }
    }
  }

  Future<void> update(
    String collectionPath, {
    required String path,
    required Map<String, dynamic> data,
  }) =>
      _firebaseFirestore.collection(collectionPath).doc(path).update(data);

  Future<void> delete(
    String collectionPath, {
    required String path,
  }) =>
      _firebaseFirestore.collection(collectionPath).doc(path).delete();

  /**BELOW FUNCTIONS ARE FOR POS */

  Future<DocumentSnapshot<Map<String, dynamic>>>
      getDaysInCurrentMonthList() async {
    return await _firebaseFirestore
        .collection("${DateTime.now().year}Collection")
        .doc(
            "${DateTime.now().year},${DateTime.now().month}") //TODO CHANGE FOR MONTH
        .get();
  }

  //Get Monthly Sales Data
  Future<QuerySnapshot<Map<String, dynamic>>> getMonthlySalesData({
    String? yearCollection,
  }) async {
    yearCollection ??= thisYearColleciton;

    return await _firebaseFirestore
        .collection(yearCollection)
        .orderBy("dateTimeMonth")
        .get();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> listenCoupon() {
    return _firebaseFirestore
        .collection(couponCollection)
        .orderBy("startDate", descending: true)
        .snapshots();
  }

  //Delete Coupon
  Future<void> deleteCoupon(String documentID) async {
    await _firebaseFirestore
        .collection(couponCollection)
        .doc(documentID)
        .delete();
  }

  //Add Coupon
  Future<void> uploadCoupon(Coupon coupon) async {
    await _firebaseFirestore.collection(couponCollection)
    .doc(coupon.documentID).set(coupon
    .toJson());
  }

  /**BELOW ARE FUNCTIONS FOR POS USER*/
  //Subtract Remain Product
  Future<void> updateRemainQuantity(PurchaseItem product) async {
    //debugPrint("******${product.snapshot}*****");
    _firebaseFirestore.runTransaction((transaction) async {
      //secure snapshot
      final secureSnapshot = await transaction
          .get(_firebaseFirestore.collection(itemCollection).doc(product.id));

      final int remainQuan = secureSnapshot.get("remainQuantity") as int;

      transaction.update(secureSnapshot.reference, {
        "remainQuantity": remainQuan - product.count,
      });
    });
  }

  //Update TotalOrder and TotalPrice in today Map
  Future<void> updateTotalForDaily(PurchaseItem product) async {
    _firebaseFirestore.runTransaction((transaction) async {
      //secure snapshot
      final secureSnapshot = await transaction.get(_firebaseFirestore
          .collection("${DateTime.now().year}Collection")
          .doc("${DateTime.now().year},${DateTime.now().month}"));

      try {
        final map = secureSnapshot.get("dateTime") as Map<String, dynamic>;
        final todayMap = map[dailyMapKey] as Map<String, dynamic>;
        final int totalOrder = todayMap["totalOrder"];
        final int totalPrice = todayMap["totalRevenue"];
        final int totalOriginalPrice = todayMap["originalTotalRevenue"];
        transaction.set(
            secureSnapshot.reference,
            {
              "dateTime": {
                dailyMapKey: {
                  "totalOrder": totalOrder + 1,
                  "totalRevenue": totalPrice + product.price * product.count,
                  "originalTotalRevenue": totalOriginalPrice +
                      product.originalPrice * product.count,
                },
              },
            },
            SetOptions(merge: true));
      } catch (e) {
        debugPrint("*********Error get totalOrder and Price $e**");
        transaction.set(
            secureSnapshot.reference,
            {
              "dateTime": {
                dailyMapKey: {
                  "totalOrder": 1,
                  "totalRevenue": product.price * product.count,
                  "originalTotalRevenue": product.originalPrice * product.count,
                }
              },
            },
            SetOptions(merge: true));
      }
    });
  }

  //Update TotalOrder and TotalPrice in today Map
  Future<void> updateTotalForMonthly(PurchaseItem product) async {
    _firebaseFirestore.runTransaction((transaction) async {
      //secure snapshot
      final secureSnapshot = await transaction.get(_firebaseFirestore
          .collection("${DateTime.now().year}Collection")
          .doc("${DateTime.now().year},${DateTime.now().month}"));
      debugPrint("*******Monthly:$secureSnapshot****");

      try {
        final int totalOrder = secureSnapshot.get("totalOrder");
        final int totalPrice = secureSnapshot.get("totalRevenue");
        final int totalOriginalPrice =
            secureSnapshot.get("originalTotalRevenue");
        transaction.set(
            secureSnapshot.reference,
            {
              "totalOrder": totalOrder + 1,
              "totalRevenue": totalPrice + product.price * product.count,
              "originalTotalRevenue":
                  totalOriginalPrice + product.originalPrice * product.count,
              "dateTimeMonth": DateTime.now(),
            },
            SetOptions(merge: true));
      } catch (e) {
        debugPrint("*********Error get totalOrder and Price $e**");
        transaction.set(
            secureSnapshot.reference,
            {
              "totalOrder": 1,
              "totalRevenue": product.price * product.count,
              "originalTotalRevenue": product.originalPrice * product.count,
              "dateTimeMonth": DateTime.now(),
            },
            SetOptions(merge: true));
      }
    });
  }
}
