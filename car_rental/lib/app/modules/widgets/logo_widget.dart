import 'package:car_rental/app/data/constatns/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WalidsLogo extends StatelessWidget {
  const WalidsLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Walid Plus',
          style: GoogleFonts.poppins(
            color: isDarkMode ? Colors.white : Colors.black,
            fontSize: Get.size.height * 0.045,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '+',
          style: GoogleFonts.poppins(
            color: AppThemes.primary,
            fontSize: Get.size.height * 0.06,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
