import 'package:car_rental/app/data/models/brand.dart';
import 'package:get/get.dart';

import '../../../data/models/car.dart';
import '../../../services/car_service.dart';

class ShowroomController extends GetxController {
  final carService = CarService.to;

// get top deals list

// get most rented cars list
  Future<List<Car>> getMostRentedCars() async {
    return await carService.getMostRentedCars();
  }

// get all brands
  Future<List<Brand>> getAllBrands() async {
    return await carService.getAllBrands();
  }
}
