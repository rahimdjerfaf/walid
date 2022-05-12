import 'package:car_rental/app/modules/details_page/binding.dart';
import 'package:car_rental/app/modules/details_page/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/brand.dart';
import '../../data/models/car.dart';
import 'controller.dart';
import 'widgets/car_widget.dart';

class AvailableCars extends GetView<AvailableCarsController> {
  const AvailableCars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              SizedBox(
                height: 16,
              ),
              Obx(() => Text(
                    "Available Cars (${controller.lenght.value})",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: FutureBuilder(
                    future: controller.getCars(),
                    builder: (context, AsyncSnapshot<List<Car>> snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("Something went wrong"),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return GridView.count(
                        physics: BouncingScrollPhysics(),
                        childAspectRatio: 1 / 1.55,
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        children: snapshot.data!.map((item) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                () => DeatilsView(),
                                binding: DeatilsPageBindings(car: item),
                              );
                            },
                            child: FutureBuilder(
                                future: controller.getBrandById(item.brandid),
                                builder:
                                    (context, AsyncSnapshot<Brand?> snapshot) {
                                  if (snapshot.hasError) {
                                    return Center(
                                      child: Text("Something went wrong"),
                                    );
                                  }
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                  return CarWidget(
                                    car: item,
                                    brand: snapshot.data!,
                                  );
                                }),
                          );
                        }).toList(),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
