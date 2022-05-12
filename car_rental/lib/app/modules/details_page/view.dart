import 'package:car_rental/app/data/constatns/app_themes.dart';
import 'package:car_rental/app/data/models/brand.dart';
import 'package:car_rental/app/modules/details_page/controller.dart';
import 'package:car_rental/app/modules/widgets/image_widget.dart';
import 'package:car_rental/app/services/car_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

class DeatilsView extends GetView<DetailsController> {
  const DeatilsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  BackButton(),
                  SizedBox(
                    width: 20,
                  ),
                  Builder(builder: (context) {
                    if (controller.car.brandname == null) {
                      return FutureBuilder(
                        future:
                            CarService.to.getBrandById(controller.car.brandid),
                        builder: ((context, AsyncSnapshot<Brand?> snapshot) {
                          if (snapshot.connectionState !=
                              ConnectionState.waiting) {
                            controller.car.brandname = snapshot.data!.name;
                            return Text(
                              "${controller.car.brandname} ",
                              style: TextStyle(
                                fontSize: Get.size.width * 0.07,
                                fontWeight: FontWeight.bold,
                                color: AppThemes.primary,
                              ),
                            );
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }),
                      );
                    }
                    return Text(
                      "${controller.car.brandname} ",
                      style: TextStyle(
                        fontSize: Get.size.width * 0.07,
                        fontWeight: FontWeight.bold,
                        color: AppThemes.primary,
                      ),
                    );
                  }),
                  Spacer(),
                  Icon(
                    Icons.star,
                    color: Colors.yellow[800],
                    size: Get.size.width * 0.06,
                  ),
                  Text(
                    controller.car.rating.toString(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.yellow[800],
                      fontSize: Get.size.width * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.size.height * 0.02),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    controller.car.model,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                      fontSize: Get.size.width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${controller.car.price}Dzd',
                    style: GoogleFonts.poppins(
                      fontSize: Get.size.width * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '/per day',
                    style: GoogleFonts.poppins(
                      fontSize: Get.size.width * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: Get.size.height * 0.02,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildStat(
                        UniconsLine.dashboard,
                        '${controller.car.power} KM',
                        'Power',
                      ),
                      buildStat(
                        UniconsLine.users_alt,
                        'People',
                        '( ${controller.car.people} )',
                      ),
                      buildStat(
                        UniconsLine.briefcase,
                        'Bags',
                        '( ${controller.car.bags} )',
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.car.images.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: Get.size.width,
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(17),
                            child: Hero(
                              tag:
                                  "${controller.car.brandid}/${controller.car.model}",
                              child: KImage(
                                url: controller.car.images[index],
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: Get.size.height * 0.01,
                  ),
                  child: SizedBox(
                    height: Get.size.height * 0.07,
                    width: Get.size.width,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xff3b22a1),
                        ),
                        child: Align(
                          child: Text(
                            'Select',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                              fontSize: Get.size.height * 0.025,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Padding buildStat(
  IconData icon,
  String title,
  String desc,
) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: Get.size.width * 0.015,
    ),
    child: SizedBox(
      height: Get.size.width * 0.32,
      width: Get.size.width * 0.25,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: Get.size.width * 0.03,
            left: Get.size.width * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: const Color(0xff3b22a1),
                size: Get.size.width * 0.08,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: Get.size.width * 0.02,
                ),
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: Get.size.width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                desc,
                style: GoogleFonts.poppins(
                  fontSize: Get.size.width * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
