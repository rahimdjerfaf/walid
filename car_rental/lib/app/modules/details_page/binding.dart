import 'package:car_rental/app/modules/details_page/controller.dart';
import 'package:get/get.dart';

class DeatilsPageBindings extends Bindings {
  final car;
  DeatilsPageBindings({this.car});
  @override
  void dependencies() {
    Get.put(DetailsController(
      car: car,
    ));
  }
}
