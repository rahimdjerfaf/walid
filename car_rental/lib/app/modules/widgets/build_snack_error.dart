import 'package:flutter/material.dart';
import 'package:get/get.dart';

buildSnackError(
  String error,
) {
  return Get.showSnackbar(
    GetSnackBar(
      title: "Ooops",
      message: error,
      backgroundColor: Colors.black,
      duration: Duration(seconds: 2),
    ),
  );
}
