import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/constatns/app_themes.dart';

class BackButton extends StatelessWidget {
  const BackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            border: Border.all(
              color: Colors.grey[300]!,
              width: 1,
            ),
          ),
          child: Icon(
            Icons.keyboard_arrow_left,
            color: AppThemes.primary,
            size: 28,
          )),
    );
  }
}
