import 'package:get/get.dart';

import '../../data/models/brand.dart';
import '../../data/models/car.dart';
import '../../services/car_service.dart';

class AvailableCarsController extends GetxController {
  // get all the cars here
  final carService = CarService.to;

  List<Car> cars = [];
  final lenght = 0.obs;

  Future<List<Car>> getCars() async {
    cars = await carService.getCars();
    lenght.value = cars.length;
    
    return cars;
  }

  Future<Brand?> getBrandById(String brandId) async {
    final brand= await carService.getBrandById(brandId);
    
    return brand;
  }

  Future<String> getImageUrl(String path) async {
    final url = await carService.getImageUrl(path);
    print(url);
    return url;
  }
}
