import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../data/constant.dart';
import '../service/database.dart';
import 'home_controller.dart';

class MangeController extends GetxController {
  final Database _database = Database();
  final HomeController _homeController = Get.find();

  Future<void> delete(String path) async {
    try {
      await _database.delete(itemCollection, path: path);
      _homeController.removeItem(path);
    } catch (e) {
      print(e);
    }
  }
}
