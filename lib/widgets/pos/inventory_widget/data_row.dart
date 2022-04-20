import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_and_ecommerce/controller/home_controller.dart';
import 'package:pos_and_ecommerce/controller/manage_controller.dart';
import 'package:pos_and_ecommerce/model/item.dart';

import '../../../routes/routes.dart';
import '../../../screen/pos/inventory_management.dart';

DataRow resuableDataRow({required ItemModel item}) {
  MangeController _manageController = Get.find();
  HomeController _homeController = Get.find();
  return DataRow(cells: <DataCell>[
    DataCell(Row(
      children: [
        //UpdateButton
        IconButton(
          onPressed: () {
            _homeController.setEditItem(item);
            _homeController.changeOwnBrandOrNot(item.isOwnBrand,
                false); //Make Sure to change Brand Options Depend On This Product.
            Get.toNamed(uploadItemScreen);
          },
          icon: const Icon(
            Icons.edit,
          ),
        ),
        //DeleteButton
        IconButton(
          onPressed: () async {
            await _manageController.delete(item.id!);
          },
          icon: const Icon(
            Icons.delete,
          ),
        )
      ],
    )),
    DataCell(customTableCell(item.id ?? "id is null")),
    DataCell(customTableCell(item.name)),
    DataCell(customTableCell("${item.quantity}")),
    DataCell(customTableCell("${item.remainQuantity}")),
    DataCell(customTableCell("${item.price}ks")),
    DataCell(customTableCell("${item.originalPrice}ks")),
  ]);
}
