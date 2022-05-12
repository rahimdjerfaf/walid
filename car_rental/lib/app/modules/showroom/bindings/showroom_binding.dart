import 'package:get/get.dart';

import '../controllers/showroom_controller.dart';

class ShowroomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowroomController>(
      () => ShowroomController(),
    );
  }
}
