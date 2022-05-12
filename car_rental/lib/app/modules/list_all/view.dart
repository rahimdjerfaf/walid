import 'package:car_rental/app/modules/widgets/brand_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/brand.dart';
import '../../data/models/car.dart';
import '../available_cars/widgets/car_widget.dart';
import '../details_page/binding.dart';
import '../details_page/view.dart';

class ListAll extends StatelessWidget {
  final Future<List> future;
  final Brand? brand;
  final lenght = 0.obs;
  ListAll({
    Key? key,
    required this.future,
    this.brand,
  }) : super(key: key);

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
                    "Availables  (${lenght.value})",
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
                    future: future,
                    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
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

                      if (snapshot.data is List<Car>) {
                        return GridView.count(
                          physics: BouncingScrollPhysics(),
                          childAspectRatio: 1 / 1.55,
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          children: snapshot.data!.map((item) {
                            return GestureDetector(
                              onTap: () {
                                // navigate to details page
                                Get.to(
                                  () => DeatilsView(),
                                  binding: DeatilsPageBindings(car: item),
                                );
                              },
                              child: CarWidget(
                                car: item,
                                brand: brand!,
                              ),
                            );
                          }).toList(),
                        );
                      }

                      if (snapshot.data is List<Brand>) {
                        return GridView.count(
                          physics: BouncingScrollPhysics(),
                          childAspectRatio: 1 / 1.55,
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          children: snapshot.data!.map((item) {
                            return BrandWidget(
                              brand: item,
                              ontap: () {},
                            );
                          }).toList(),
                        );
                      }
                      return Container();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
