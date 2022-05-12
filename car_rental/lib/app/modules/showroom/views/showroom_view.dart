import 'package:car_rental/app/modules/available_cars/binding.dart';
import 'package:car_rental/app/modules/available_cars/view.dart';
import 'package:car_rental/app/modules/showroom/views/widgets/most_rented.dart';
import 'package:car_rental/app/modules/showroom/views/widgets/top_brands.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/constatns/app_themes.dart';
import '../controllers/showroom_controller.dart';

class ShowroomView extends GetView<ShowroomController> {
  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 4,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.size.height * 0.05,
            ),
            Text(
              'Enjoy the fun driving in Enterprise',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: isDarkMode ? Colors.white : const Color(0xff3b22a1),
                fontSize: size.width * 0.045,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TopBrands(),
            GestureDetector(
              onTap: () {
                Get.to(
                  () => AvailableCars(),
                  binding: AvailableCarsBinding(),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(top: 16, right: 16, left: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppThemes.primary,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  padding: EdgeInsets.all(24),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Available Cars",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Long term and short term",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        height: 50,
                        width: 50,
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: AppThemes.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.size.height * 0.05,
            ),
            MostRented(),
          ],
        ),
      ),
    );
  }
}
