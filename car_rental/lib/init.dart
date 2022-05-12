import 'package:get/get.dart';

import 'app/services/car_service.dart';
import 'app/services/services.dart';

void init() {
  Get.put<AuthService>(AuthService());
  Get.put<ThemeController>(ThemeController());
  Get.put<LanguageController>(LanguageController());
  Get.put<CarService>(CarService());
}
