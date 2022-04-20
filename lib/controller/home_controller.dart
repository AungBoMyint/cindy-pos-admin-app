import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos_and_ecommerce/constant/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../data/constant.dart';
import '../data/enum.dart';
import '../model/hive_item.dart';
import '../model/item.dart';
import '../model/pos/coupon.dart';
import '../model/purchase.dart';
import '../model/purchase_item.dart';
import '../model/user.dart';
import '../service/api.dart';
import '../service/auth.dart';
import '../service/database.dart';

class HomeController extends GetxController {
  final Auth _auth = Auth();
  final Database _database = Database();
  final Api _api = Api();
  final ImagePicker _imagePicker = ImagePicker();

  final RxBool authorized = false.obs;
  final Rx<AuthUser> user = AuthUser().obs;

  final RxBool phoneState = false.obs;
  final codeSentOnWeb = false.obs; //codeSentOnWeb on Web
  final TextEditingController _phoneCodeController =
      TextEditingController(); //On Web
  late SharedPreferences
      sharedPref; //Share Preference to Store User's Order Data
  String? townshipName; //Township Name
  var paymentOptions = PaymentOptions.None.obs; //Payment Option Initial Value
  var checkOutStep = 0.obs; //Check Out Step
  var bankSlipImage = "".obs;
  Map<String, dynamic> townShipNameAndFee = {}; //Township Name and Fee

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController verificationController = TextEditingController();

  final RxString _codeSentId = ''.obs;
  final RxInt _codeSentToken = 0.obs;

  final RxList<PurchaseItem> myCart = <PurchaseItem>[].obs;

  bool isOwnBrand = false;
  int mouseIndex = -1; //Mouse Region

  void changeMouseIndex(int i) {
    // Change Mouse Region
    mouseIndex = i;
    debugPrint("On Mouse Exist************");
    update();
  }

  //BlueToothPrint Instance
  //BluetoothPrint blueToothPrint = BluetoothPrint.instance;
  //BlueToothDevice
  //BluetoothDevice? blueToothDevice;

  //Set Device and Connect
  /* void setDeviceAndConnect(BluetoothDevice device) {
    blueToothDevice = device;
    if (!(blueToothDevice == null)) {
      //We connect
      blueToothPrint.connect(blueToothDevice!);
    }
    update();
  }*/

  //Chage OwnBand
  void changeOwnBrandOrNot(bool value, bool isUpdate) {
    isOwnBrand = value;
    if (isUpdate) {
      update();
    }
  }

  //Set Shipping Fee
  void setTownshipName(String? val) {
    townshipName = val!;
    update();
  }

  //Set Township Name
  void setTownShipNameAndShip({required String name, required String fee}) {
    townShipNameAndFee = {
      "townName": name,
      "fee": int.parse(fee),
    };
    update();
  }

  //Change Payment Option
  void changePaymentOptions(PaymentOptions option) {
    paymentOptions.value = option;
  }

  //Change Step Index
  void changeStepIndex(int value) {
    checkOutStep.value = value;
  }

  //Set Bank Slip Image
  void setBankSlipImage(String image) {
    bankSlipImage.value = image;
  }

  void addToCart(ItemModel itemModel, String color, String size, int price,
      String priceType, bool isCoupon) {
    try {
      final PurchaseItem _item = myCart.firstWhere(
        (item) =>
            item.id == itemModel.id &&
            item.color == color &&
            item.size == size &&
            item.price == price &&
            item.priceType == priceType,
      );
      myCart.value = myCart.map((element) {
        if (_item.id == element.id) {
          return PurchaseItem(
            id: element.id,
            itemName: element.itemName,
            count: element.count + 1,
            size: element.size,
            color: element.color,
            priceType: element.priceType,
            isOwnBrand: element.isOwnBrand,
            price: element.price,
            originalPrice: element.originalPrice,
            isCouponInclude: element.isCouponInclude,
          );
        }
        return element;
      }).toList();
    } catch (e) {
      myCart.add(PurchaseItem(
        id: itemModel.id!,
        itemName: itemModel.name,
        count: 1,
        size: size,
        color: color,
        priceType: priceType,
        isOwnBrand: itemModel.isOwnBrand,
        price: price,
        originalPrice: itemModel.originalPrice,
        isCouponInclude: isCoupon,
      ));
    }
  }

  final RxList<ItemModel> items = <ItemModel>[].obs;
  final RxList<ItemModel> brandItems = <ItemModel>[].obs; //Brand Item
  final RxList<ItemModel> exportAndBrandItems = <ItemModel>[].obs;
  final RxList<ItemModel> searchitems = <ItemModel>[].obs;

  //set export and brand items when edit page start
  /*void setExportAndBrandItems() {
    exportAndBrandItems.value = [];
    items.forEach((element) {
      exportAndBrandItems.add(element);
    });
    brandItems.forEach((element) {
      exportAndBrandItems.add(element);
    });
  }*/

  final Rx<ItemModel> selectedItem = ItemModel(
    photo: '',
    photo2: '',
    photo3: '',
    deliverytime: '',
    brand: '',
    discountprice: 0,
    name: '',
    price: 0,
    color: '',
    desc: '',
    size: '',
    star: 0,
    category: '',
    isOwnBrand: false,
    originalPrice: 0,
    quantity: 0,
    remainQuantity: 0,
  ).obs;

  void setSelectedItem(ItemModel item) {
    selectedItem.value = item;
  }

  final Rx<ItemModel> editItem = ItemModel(
    photo: '',
    photo2: '',
    photo3: '',
    deliverytime: '',
    brand: '',
    discountprice: 0,
    name: '',
    price: 0,
    color: '',
    desc: '',
    size: '',
    star: 0,
    category: '',
    isOwnBrand: false,
    originalPrice: 0,
    quantity: 0,
    remainQuantity: 0,
  ).obs;

  void setEditItem(ItemModel itemModel) {
    editItem.value = itemModel;
  }

  ItemModel getItem(String id) {
    try {
      return items.firstWhere((e) => e.id == id);
    } catch (e) {
      return ItemModel(
        photo: '',
        photo2: '',
        photo3: '',
        deliverytime: '',
        brand: '',
        discountprice: 0,
        name: '',
        price: 0,
        color: '',
        desc: '',
        size: '',
        star: 0,
        category: '',
        isOwnBrand: false,
        originalPrice: 0,
        quantity: 0,
        remainQuantity: 0,
      );
    }
  }

  //Get Brand Item
  ItemModel getBrandItem(String id) {
    try {
      return brandItems.firstWhere((e) => e.id == id);
    } catch (e) {
      return ItemModel(
        photo: '',
        photo2: '',
        photo3: '',
        deliverytime: '',
        brand: '',
        discountprice: 0,
        name: '',
        price: 0,
        color: '',
        desc: '',
        size: '',
        star: 0,
        category: '',
        isOwnBrand: false,
        originalPrice: 0,
        quantity: 0,
        remainQuantity: 0,
      );
    }
  }

  List<ItemModel> getItems() => category.value == 'All'
      ? items
      : items.where((e) => e.category == category.value).toList();

  //GetBrandItems
  List<ItemModel> getBrandItems() => brandCategory.value == 'All'
      ? brandItems
      : brandItems.where((e) => e.category == brandCategory.value).toList();

  List<String> categoryList() {
    final List<String> _data = [
      'All',
    ];

    for (var i = 0; i < items.length; i++) {
      if (!_data.contains(items[i].category)) {
        _data.add(items[i].category);
      }
    }

    if (items.isEmpty) {
      _data.clear();
    }
    return _data;
  }

  //Brand Category List
  List<String> brandCategoryList() {
    final List<String> _data = [
      'All',
    ];

    for (var i = 0; i < brandItems.length; i++) {
      if (!_data.contains(brandItems[i].category)) {
        _data.add(brandItems[i].category);
      }
    }

    if (brandItems.isEmpty) {
      _data.clear();
    }
    return _data;
  }

  List<ItemModel> pickUp() =>
      items.where((e) => e.category == 'New Products').toList();

  List<ItemModel> hot() =>
      items.where((e) => e.category == 'Hot Sales').toList();

  void removeItem(String id) => items.removeWhere((item) => item.id == id);

  //int shipping() => myCart.isEmpty ? 0 : shippingFee;

  void addCount(PurchaseItem p) {
    myCart.value = myCart.map((element) {
      if (element.id == p.id &&
          element.color == p.color &&
          element.size == p.size) {
        return PurchaseItem(
          id: element.id,
          itemName: element.itemName,
          count: element.count + 1,
          size: element.size,
          color: element.color,
          priceType: element.priceType,
          isOwnBrand: element.isOwnBrand,
          price: element.price,
          originalPrice: element.originalPrice,
          isCouponInclude: element.isCouponInclude,
        );
      }
      return element;
    }).toList();
    update([myCart]);
    updateSubTotal(true);
  }

  void remove(PurchaseItem p) {
    bool needToRemove = false;
    myCart.value = myCart.map((element) {
      if (element.id == p.id &&
          element.color == p.color &&
          element.size == p.size) {
        if (element.count > 1) {
          return PurchaseItem(
            id: element.id,
            itemName: element.itemName,
            count: element.count - 1,
            size: element.size,
            color: element.color,
            priceType: element.priceType,
            isOwnBrand: element.isOwnBrand,
            price: element.price,
            originalPrice: element.originalPrice,
            isCouponInclude: element.isCouponInclude,
          );
        }
        needToRemove = true;
        return element;
      }
      return element;
    }).toList();
    if (needToRemove) {
      myCart.removeWhere((element) =>
          element.id == p.id &&
          element.color == p.color &&
          element.size == p.size);
    }
    updateSubTotal(true);
  }

  int subTotal = 0;
  int couponDiscountTotal = 0;
  /**For POS COUPON DISCOUNT */
  void updateSubTotal(bool isUpdate) {
    if (subTotal != 0) {
      subTotal = 0;
    }
    int price = 0;
    for (var i = 0; i < myCart.length; i++) {
      //print(items.firstWhere((element) => element.id == myCart[i].id).price);
      debugPrint("**********each price:$i: ${myCart[i].price}");
      /* price += items.firstWhere((element) => element.id == myCart[i].id).price *
          myCart[i].count;*/
      int prePrice = myCart[i].isCouponInclude
          ? (myCart[i].price * myCart[i].count) -
              ((myCart[i].price * myCart[i].count) *
                      couponList.last.percentage /
                      100)
                  .round()
          : myCart[i].price * myCart[i].count;
      price += prePrice;
    }
    subTotal = price;
    /**LOGIC FOR COUPON DISCOUNT */
    if (couponList.isNotEmpty &&
        (DateTime.now().isBefore(couponList.last.expireDate))) {
      couponDiscountTotal =
          subTotal - (subTotal * (couponList.last.percentage / 100)).round();
    }
    debugPrint("*************$subTotal");
    if (isUpdate) {
      update();
    }
  }

  //Get HiveItem
  HiveItem changeHiveItem(ItemModel model) {
    return HiveItem(
      id: model.id ?? "",
      photo: model.photo,
      photo2: model.photo2,
      photo3: model.photo3,
      name: model.name,
      brand: model.brand,
      deliverytime: model.deliverytime,
      price: model.price,
      discountprice: model.discountprice,
      desc: model.desc,
      color: model.color,
      size: model.size,
      star: model.star,
      category: model.category,
      isOwnBrand: model.isOwnBrand,
    );
  }

  //Get ItemModel
  ItemModel changeItemModel(HiveItem model) {
    return ItemModel(
      id: model.id,
      photo: model.photo,
      photo2: model.photo2,
      photo3: model.photo3,
      name: model.name,
      brand: model.brand,
      deliverytime: model.deliverytime,
      price: model.price,
      discountprice: model.discountprice,
      desc: model.desc,
      color: model.color,
      size: model.size,
      star: model.star,
      category: model.category,
      isOwnBrand: model.isOwnBrand,
      //TODO: TO CHANGE LOGIC
      originalPrice: 0,
      quantity: 0,
      remainQuantity: 0,
    );
  }

  final RxList<PurchaseModel> _purchcases = <PurchaseModel>[].obs; ////

  List<PurchaseModel> purchcasesCashOn() {
    return _purchcases.where((item) => item.bankSlipImage == null).toList();
  }

  List<PurchaseModel> purchcasesPrePay() {
    return _purchcases.where((item) => item.bankSlipImage != null).toList();
  } //////////////////

  final RxBool isLoading = false.obs;

  Future<void> proceedToPay() async {
    if (isLoading.value) return;
    isLoading.value = true;
    Get.back();
    try {
      final list = getUserOrderData();
      final _purchase = PurchaseModel(
          id: Uuid().v1(),
          items: myCart.map((element) => element).toList(),
          name: list[0],
          email: list[1],
          phone: int.parse(list[2]),
          address: list[3],
          bankSlipImage:
              bankSlipImage.value.isEmpty ? null : bankSlipImage.value,
          deliveryTownshipInfo: [
            townShipNameAndFee["townName"],
            townShipNameAndFee["fee"]
          ],
          dateTime: DateTime.now());
      await _database.writePurchaseData(_purchase).then((value) {
        Get.snackbar("လူကြီးမင်း Order တင်ခြင်း", 'အောင်မြင်ပါသည်');
      }); //submit success
      myCart.clear();
      navIndex.value = 0;
      update([myCart, navIndex]);
    } catch (e) {
      Get.snackbar("လူကြီးမင်း Order တင်ခြင်း", 'မအောင်မြင်ပါ');
      print("proceed to pay error $e");
    }
    //Get.back();
    isLoading.value = false;
  }

  Future<void> login() async {
    try {
      if (_codeSentId.value.isNotEmpty || phoneState.value) {
        await confirm();
        return;
      }
      //Change method base on Platform Conditionally
      if (kIsWeb) {
        debugPrint("Web Sign In"); //Debug Print
        //web login
        await _auth.loginInWeb(
          phoneNumber: phoneController.text,
          enterCode: (callBack) => showDialogToEnterPhoneCode(
            (phoneCode) => callBack(phoneCode),
          ),
        ); //FOR WEB SIGNIN WITH PHONE
      } else {
        await _auth.login(
          phoneNumber: phoneController.text,
          verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
          codeAutoRetrievalTimeout: (String verificationId) {},
          codeSent: (String verificationId, int? forceResendingToken) {
            _codeSentId.value = verificationId;
            _codeSentToken.value = forceResendingToken ?? 0;
            update([_codeSentId, _codeSentToken]);
          },
          verificationFailed: (FirebaseAuthException error) {},
        );
        phoneState.value = true;
      }
    } catch (e) {
      print("login error $e");
    }
  }

  Future<void> confirm() async {
    try {
      await _auth.loginWithCerdential(PhoneAuthProvider.credential(
        verificationId: _codeSentId.value,
        smsCode: verificationController.text,
      ));
      _codeSentId.value = '';
      phoneState.value = false;
      phoneController.clear();
      verificationController.clear();
    } catch (e) {
      print("confirm error is $e");
    }
  }

  Future<void> logout() async {
    try {
      await _auth.logout();
    } catch (e) {
      print("logout error is $e");
    }
  }

  Future<void> uploadProfile() async {
    try {
      final XFile? _file =
          await _imagePicker.pickImage(source: ImageSource.gallery);

      if (_file != null) {
        await _api.uploadFile(
          _file.path,
          fileName: user.value.user?.uid,
          folder: profileUrl,
        );
        await _database.write(
          profileCollection,
          data: {
            'link': user.value.user?.uid,
          },
          path: user.value.user?.uid,
        );
        user.value.update(
          newProfileImage: '$baseUrl$profileUrl${user.value.user?.uid}',
        );
        update([user]);
      }
    } catch (e) {
      print("profile upload error $e");
    }
  }

  //Get User's Order Data
  List<String> getUserOrderData() {
    return sharedPref.getStringList("userOrder") ?? [];
  }

  //Set User's Order Data or Not
  Future<void> setUserOrderData({
    required String name,
    required String email,
    required String phone,
    required String address,
  }) async {
    //Making Purchase Model
    try {} catch (e) {}
    final list = getUserOrderData();
    //Check data already contain with the same data inside SharedPreference
    if (list.isEmpty) {
      await sharedPref
          .setStringList("userOrder", [name, email, phone, address]);
    } else if ( //Something is changed by User,then we restore
        (name != list[0]) ||
            (email != list[1]) ||
            (phone != list[2]) ||
            (address != list[3])) {
      await sharedPref
          .setStringList("userOrder", [name, email, phone, address]);
    }
  }

  @override
  void onInit() async {
    super.onInit();
    ever(items, addToExportAndBrandList);
    ever(brandItems, addToExportAndBrandList);
    sharedPref = await SharedPreferences.getInstance();
    if (getUserOrderData().isNotEmpty) {
      checkOutStep.value = 1;
    } // SharedPreference to Stroe
    _database.watch(itemCollection).listen((event) {
      items.value =
          event.docs.map((e) => ItemModel.fromJson(e.data(), e.id)).toList();
      refreshTotalProductAndRemainProduct();
    });
    //For Branch Collection
    _database.watch(brandCollection).listen((event) {
      brandItems.value =
          event.docs.map((e) => ItemModel.fromJson(e.data(), e.id)).toList();
      refreshTotalProductAndRemainProduct();
    });

    /**WATCH COUPON FOR POS IF ADMIN */
    _database.watchCoupon(couponCollection).listen((event) {
      if (event.docs.isEmpty) {
        couponList.clear();
        //NEED TO REMOVE THE LAST COUPON PURCHASE and UPDATE TOTAL
        refreshPurchaseItem();
      } else {
        couponList.value =
            event.docs.map((e) => Coupon.fromJson(e.data())).toList();
      }
    });

    ///
    _auth.onAuthChange().listen((_) async {
      user.value = AuthUser(user: _);
      if (_ == null) {
        authorized.value = false;
      } else {
        authorized.value = true;
        await _database.write(
          userCollection,
          data: {
            'uid': _.uid,
            'phone': _.phoneNumber,
          },
          path: _.uid,
        );
        final DocumentSnapshot<Map<String, dynamic>> _data =
            await _database.read(userCollection, path: _.uid);
        user.value = user.value.update(
          newIsAdmin: _data.exists,
        );
        final DocumentSnapshot<Map<String, dynamic>> _profile =
            await _database.read(profileCollection, path: _.uid);
        user.value = user.value.update(
          newProfileImage: _profile.data()?['link'],
        );
        if (user.value.isAdmin) {
          _database.watchOrder(purchaseCollection).listen((event) {
            if (event.docs.isEmpty) {
              _purchcases.clear();
            } else {
              _purchcases.value = event.docs
                  .map((e) => PurchaseModel.fromJson(e.data()))
                  .toList();
            }
          });
        }
      }
    });

    //Listen BlueTooth State
    /*blueToothPrint.state.listen((event) {
      switch (event) {
        case BluetoothPrint.CONNECTED:
          Get.showSnackbar(GetBar(message: "Connected"));
          break;
        case BluetoothPrint.DISCONNECTED:
          Get.showSnackbar(GetBar(message: "Disconnected"));
          break;
        default:
          break;
      }
    });*/
  }

  final RxInt navIndex = 0.obs;

  void changeNav(int i) {
    navIndex.value = i;
  }

  final RxString category = 'All'.obs;
  final RxString brandCategory = 'All'.obs; //BrandCategory

  void changeCat(String name) {
    category.value = name;
  }

  //Change Brand Cat
  void changeBrandCat(String name) {
    brandCategory.value = name;
  }

  final RxBool isSearch = false.obs;

  void search() => isSearch.value = !isSearch.value;

  void onSearch(String name) {
    isSearch.value = true;
    searchitems.value = exportAndBrandItems
        .where((p0) => p0.name.toLowerCase().contains(name.toLowerCase()))
        .toList();
  }

  void clear() => isSearch.value = false;

  void searchItem(String name) {
    isSearch.value = !isSearch.value;
  }

  //Check weather show dialog or not
  showDialogToEnterPhoneCode(void Function(String code) callBack) {
    final size = MediaQuery.of(Get.context!).size;
    Get.defaultDialog(
      title: "Phone Verification",
      content: SizedBox(
        height: size.height * 0.2,
        width: size.width * 0.2,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Text FIELD
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextFormField(
                  controller: _phoneCodeController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your code',
                  ),
                ),
              ),
              //Space
              const SizedBox(height: 10),
              //CONFIRM
              TextButton(
                onPressed: () {
                  //CALL BACK TO ORIGINAL SIGNINWITHPHONENUMBER
                  callBack(_phoneCodeController.text);
                  Get.back();
                },
                child: Text("Confirm"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  addToExportAndBrandList(List<ItemModel> callback) {
    exportAndBrandItems.value = [];
    callback.forEach((element) {
      exportAndBrandItems.add(element);
    });
  }

  /***New Add Variable and Function for POS*/
  var pieTouchIndex = -1.obs;
  var totalProduct = 0.obs;
  var remainProduct = 0.obs;
  RxList<Coupon> couponList = <Coupon>[].obs;
  Future<DocumentSnapshot<Map<String, dynamic>>> getDaysSales() async {
    return _database.getDaysInCurrentMonthList();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getMonthsSales() async {
    return _database.getMonthlySalesData();
  }

  void refreshTotalProductAndRemainProduct() {
    totalProduct.value = 0;
    remainProduct.value = 0;
    if (items.isNotEmpty) {
      items.forEach((element) {
        totalProduct.value += element.quantity;
        remainProduct.value += element.remainQuantity;
      });
    }
    if (brandItems.isNotEmpty) {
      brandItems.forEach((element) {
        totalProduct.value += element.quantity;
        remainProduct.value += element.remainQuantity;
      });
    }
  }

  Future<void> addCoupon({required Coupon coupon}) async {
    _database.uploadCoupon(coupon);
  }

  Future<void> removeCoupon({required String documentID}) async {
    _database.deleteCoupon(documentID);
  }

  String? checkCouponIsValid(String? value) {
    return (couponList.isNotEmpty &&
            couponList.last.code == value &&
            DateTime.now().isBefore(couponList.last.expireDate))
        ? null
        : "Coupon is not valid";
  }

  void changeIsIncludeCouponToFalse(PurchaseItem item) {
    myCart.value = myCart.map((element) {
      if (element.id == item.id) {
        return element.copyWith(
          isCouponInclude: false,
        );
      } else {
        return element;
      }
    }).toList();
    updateSubTotal(true);
  }

  void refreshPurchaseItem() {
    myCart.value = myCart.map((element) {
      if (element.isCouponInclude) {
        return element.copyWith(
          isCouponInclude: false,
        );
      } else {
        return element;
      }
    }).toList();
    updateSubTotal(true);
  }

  bool checkCouponNotExistOrExpired() {
    return couponList.isEmpty ||
        DateTime.now().isAfter(couponList.last.expireDate);
  }
}
