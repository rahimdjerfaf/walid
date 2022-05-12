import 'package:car_rental/app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController(text: "");
  final emailController = TextEditingController(text: "");
  final passwordController = TextEditingController(text: "");
  final rePasswordController = TextEditingController(text: "");
  final checkedValue = false.obs;
  final registerSwitch = false.obs;
  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.onClose();
  }

  void login() {
    if (formKey.currentState!.validate()) {
      AuthService.to.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    }
  }

  void register() {
    if (formKey.currentState!.validate()) {
      AuthService.to.registerWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        name: nameController.text.trim(),
      );
    }
  }
}
