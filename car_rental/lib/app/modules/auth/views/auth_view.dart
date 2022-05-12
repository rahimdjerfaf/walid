import 'package:car_rental/app/modules/auth/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import 'login_view.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SafeArea(
              child: Form(
        key: controller.formKey,
        child: Obx(
          () => controller.registerSwitch.isFalse ? LoginView() : RegisterView(),
        ),
      ))),
    );
  }
}
