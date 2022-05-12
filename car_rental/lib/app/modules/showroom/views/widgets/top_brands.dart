import 'package:car_rental/app/data/models/brand.dart';
import 'package:car_rental/app/modules/list_all/view.dart';
import 'package:car_rental/app/modules/widgets/brand_widget.dart';
import 'package:car_rental/app/services/car_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../data/constatns/app_themes.dart';
import '../../controllers/showroom_controller.dart';

class TopBrands extends GetView<ShowroomController> {
  const TopBrands({Key? key}) : super(key: key);

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
                "Top Brands",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: Get.size.width * 0.055,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'View All',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: Get.size.width * 0.04,
                    color: AppThemes.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 220,
          margin: EdgeInsets.only(bottom: 16),
          child: FutureBuilder(
              future: controller.getAllBrands(),
              builder: (context, AsyncSnapshot<List<Brand>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return Center(
                      child: Text('No Brands'),
                    );
                  } else {
                    final brands = snapshot.data!;

                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(5),
                      scrollDirection: Axis.horizontal,
                      itemCount: brands.length,
                      itemBuilder: (context, index) {
                        final brand = brands[index];
                        return SizedBox(
                          width: 150,
                          height: 150,
                          child: BrandWidget(
                            brand: brand,
                            ontap: () {
                              Get.to(
                                ListAll(
                                  future: CarService.to
                                      .getAllCarsByBrand(brand.uid),
                                  brand: brand,
                                ),
                              );
                            },
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
