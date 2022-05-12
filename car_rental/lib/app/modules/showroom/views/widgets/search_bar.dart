import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

import '../../../../data/constatns/app_themes.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        Get.height * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              //searchbar
              style: GoogleFonts.poppins(),
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  top: Get.size.height * 0.01,
                  left: Get.size.width * 0.04,
                  right: Get.size.width * 0.04,
                ),
                enabledBorder: textFieldBorder(),
                focusedBorder: textFieldBorder(),
                border: textFieldBorder(),
                hintStyle: GoogleFonts.poppins(),
                hintText: 'Search a car',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: Get.size.width * 0.025,
            ),
            child: Container(
              height: Get.size.height * 0.06,
              width: Get.size.width * 0.14,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10,
                  ),
                ),
                color: AppThemes.primary, //filters bg color
              ),
              child: Icon(
                UniconsLine.sliders_v,
                color: Colors.white,
                size: Get.size.height * 0.032,
              ),
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder textFieldBorder() {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.5),
        width: 1.0,
      ),
    );
  }
}
