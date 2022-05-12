import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../data/models/brand.dart';
import '../data/models/car.dart';

class CarService {
  static CarService to = Get.find();
  final cars = FirebaseFirestore.instance.collection("cars");
  final brands = FirebaseFirestore.instance.collection("brands");
  final storage = FirebaseStorage.instance;
  Future<List<Car>> getCars() async {
    List<Car> carsList = [];
    await cars.get().then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        carsList.add(Car.fromMap(doc.data()));
      }
    });
    return carsList;
  }

  Future<List<Brand>> getAllBrands() async {
    List<Brand> brandsList = [];
    await brands.get().then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        brandsList.add(Brand.fromMap(doc.data()));
      }
    });
    return brandsList;
  }

  Future<List<Car>> getCarsByBrand(String brand) async {
    List<Car> carsList = [];

    return carsList;
  }

  Future<Brand?> getBrandById(String brandId) async {
    final doc = await brands.doc(brandId).get();
    if (doc.exists) {
      return Brand.fromMap(doc.data()!);
    }

    return null;
  }

  Future<String> getImageUrl(String path) async {
    return await storage.ref().child(path).getDownloadURL();
  }

  Future<List<Car>> getMostRentedCars() async {
    List<Car> carsList = [];
    await cars.get().then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        carsList.add(Car.fromMap(doc.data()));
      }
    });
    return carsList;
  }

  Future<List<Car>> getAllCarsByBrand(String brandId) async {
    List<Car> carsList = [];
    final querySnapshot = await cars.where('brand', isEqualTo: brandId).get();
    for (var doc in querySnapshot.docs) {
      if (doc.exists) {
        carsList.add(Car.fromMap(doc.data()));
      }
    }
    return carsList;
  }
}
