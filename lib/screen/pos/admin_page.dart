import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pos_and_ecommerce/controller/manage_controller.dart';

import '../../data/constant.dart';
import '../../routes/routes.dart';
import '../../widgets/pos/card_row.dart';

class POSPage extends StatefulWidget {
  const POSPage({Key? key}) : super(key: key);

  @override
  State<POSPage> createState() => _POSPageState();
}

class _POSPageState extends State<POSPage> {
  @override
  void initState() {
    Get.put(MangeController());
    super.initState();
  }

  @override
  void dispose() {
    Get.delete();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appBarColor,
        leading: Container(
          margin: EdgeInsets.only(
            top: 7,
            bottom: 10,
            left: 7,
          ),
          width: 40,
          child: ElevatedButton(
            style: ButtonStyle(
              alignment: Alignment.center,
              padding: MaterialStateProperty.all(EdgeInsets.all(0)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              )),
              overlayColor: MaterialStateProperty.all(Colors.black12),
            ),
            onPressed: Get.back,
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        SizedBox(
          height: 20,
        ),
        //First Row
        SizedBox(
            height: 120,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //Account Settings
                    CardRow(
                      icon: FontAwesomeIcons.userCog,
                      color: Colors.red,
                      text: "Settings",
                      navigateRoute: () => Get.toNamed(salesUrl),
                    ),
                    //Sales
                    CardRow(
                      icon: FontAwesomeIcons.moneyBill,
                      color: Colors.green,
                      text: "Sales Analysis",
                      navigateRoute: () => Get.toNamed(salesUrl),
                    ),
                  ]),
            )),
        SizedBox(
          height: 20,
        ),
        //Second Row
        SizedBox(
          height: 120,
          width: size.width,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            //Inventory Management
            CardRow(
              icon: FontAwesomeIcons.boxes,
              color: Colors.purple,
              text: "Inventory Management",
              navigateRoute: () => Get.toNamed(inventoryUrl),
            ),
            //Management Cupon
            CardRow(
              icon: FontAwesomeIcons.gift,
              color: Colors.blue,
              text: "Coupon Management",
              navigateRoute: () => Get.toNamed(couponUrl),
            ),
          ]),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 120,
          width: size.width,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            //Inventory Management
            CardRow(
              icon: FontAwesomeIcons.funnelDollar,
              color: Colors.purple,
              text: "Reward Management",
              navigateRoute: () => Get.toNamed(inventoryUrl),
            ),
            //Management Cupon
            CardRow(
              icon: FontAwesomeIcons.receipt,
              color: Colors.blue,
              text: "Order Management",
              navigateRoute: () => Get.toNamed(couponUrl),
            ),
          ]),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 120,
          width: size.width,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            //Inventory Management
            CardRow(
              icon: FontAwesomeIcons.barcode,
              color: Colors.purple,
              text: "Barcode Management",
              navigateRoute: () => Get.toNamed(inventoryUrl),
            ),
            //Management Cupon
            CardRow(
              icon: FontAwesomeIcons.dollarSign,
              color: Colors.blue,
              text: "Expense",
              navigateRoute: () => Get.toNamed(couponUrl),
            ),
          ]),
        ),
      ])),
    );
  }
}
