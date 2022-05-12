import 'package:get/get.dart';

import 'controller.dart';

class AvailableCarsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AvailableCarsController());
  }
}
