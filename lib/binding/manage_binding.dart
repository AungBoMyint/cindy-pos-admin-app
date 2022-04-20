import 'package:get/instance_manager.dart';

import '../controller/manage_controller.dart';


class ManageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MangeController());
  }
}
