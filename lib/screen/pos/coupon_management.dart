import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:colours/colours.dart';
import 'package:pos_and_ecommerce/controller/home_controller.dart';

import '../../controller/pos/sales_controller.dart';
import '../../utils/theme.dart';
import '../../widgets/pos/coupon/coupon_form.dart';
import 'inventory_management.dart';

class CouponManagement extends StatefulWidget {
  const CouponManagement({Key? key}) : super(key: key);

  @override
  State<CouponManagement> createState() => _CouponManagementState();
}

class _CouponManagementState extends State<CouponManagement> {
  @override
  void initState() {
    Get.put(SalesController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    SalesController _saleController = Get.find();
    HomeController _controller = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Coupon Management",
          style: TextStyle(
              color: Colors.black,
              wordSpacing: 1,
              letterSpacing: 1,
              fontSize: 16),
        ),
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Coupon Table",
                    style: TextStyle(
                      color: Color.fromARGB(255, 15, 70, 17),
                      fontSize: 16,
                      wordSpacing: 1,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    )),
                //Space
                const SizedBox(width: 15),
                //Add Button
                ElevatedButton(
                  onPressed: () {
                    Get.defaultDialog(
                      confirm: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colours.gold,
                        ),
                        onPressed: () => _saleController.addCoupon(),
                        child: const Text("Upload",
                            style: TextStyle(
                              color: Colors.black,
                            )),
                      ),
                      title: "Add New Product",
                      content: const CouponFormWidget(),
                    );
                  },
                  child: const Text("Add New Coupon",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
            SizedBox(height: 10),
            //Coupon Table
            SizedBox(
                height: size.height * 0.7,
                child: Obx(() {
                  return ListView(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          border: TableBorder.all(color: Colors.black),
                          headingTextStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          showCheckboxColumn: false,
                          columns: <DataColumn>[
                            DataColumn(label: customTableCell("Delete")),
                            DataColumn(
                                label: customTableCell("Discount Content")),
                            DataColumn(label: customTableCell("Code")),
                            DataColumn(label: customTableCell("Percentage")),
                            DataColumn(label: customTableCell("Start Date")),
                            DataColumn(label: customTableCell("Expire Date")),
                          ],
                          rows: _controller.couponList.map((item) {
                            return DataRow(cells: <DataCell>[
                              DataCell(
                                //UpdateButton
                                IconButton(
                                  onPressed: () async {
                                    _controller
                                        .removeCoupon(
                                            documentID: item.documentID!)
                                        .then((value) => debugPrint(
                                            "******Delete Successfully**"));
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              DataCell(customTableCell(item.discountContent)),
                              DataCell(customTableCell(item.code)),
                              DataCell(customTableCell("${item.percentage}")),
                              DataCell(customTableCell("${item.startDate}")),
                              DataCell(customTableCell("${item.expireDate}")),
                            ]);
                          }).toList(),
                        ),
                      )
                    ],
                  );
                })),
          ],
        ),
      ),
    );
  }
}
