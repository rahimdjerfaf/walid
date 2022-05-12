import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../data/models/car.dart';
import '../../../details_page/binding.dart';
import '../../../details_page/view.dart';
import '../../../widgets/image_widget.dart';
import '../../controllers/showroom_controller.dart';

class MostRented extends GetView<ShowroomController> {
  const MostRented({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(Get.size.width * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Most Rented Cars",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: Get.size.width * 0.055,
                ),
              ),
              // Text(
              //   'View All',
              //   textAlign: TextAlign.center,
              //   style: GoogleFonts.poppins(
              //     fontSize: Get.size.width * 0.04,
              //     color: AppThemes.primary,
              //   ),
              // ),
            ],
          ),
        ),
        Container(
          height: 150,
          margin: EdgeInsets.only(bottom: 16),
          child: FutureBuilder(
              future: controller.getMostRentedCars(),
              builder: (context, AsyncSnapshot<List<Car>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return Center(
                      child: Text('No Cars'),
                    );
                  } else {
                    final cars = snapshot.data!;

                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(5),
                      scrollDirection: Axis.horizontal,
                      itemCount: cars.length,
                      itemBuilder: (context, index) {
                        final car = cars[index];
                        final size = Get.size.height * 0.3;
                        return InkWell(
                          onTap: () {
                            Get.to(
                              () => DeatilsView(),
                              binding: DeatilsPageBindings(car: car),
                            );
                          },
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: size,
                                    height: size,
                                    child: KImage(
                                      url: car.images.first,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    left: 5,
                                    child: Text(
                                      car.model,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                }
                return Center(
                  child: Text('something went wrong'),
                );
              }),
        ),
      ],
    );
  }
}
