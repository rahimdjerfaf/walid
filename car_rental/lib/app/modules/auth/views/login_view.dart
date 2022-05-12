import 'package:car_rental/app/data/utils/regexp.dart';
import 'package:car_rental/app/modules/widgets/button.dart';
import 'package:car_rental/app/modules/widgets/k_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/auth_controller.dart';

class LoginView extends GetWidget<AuthController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "Hey there".tr,
            style: GoogleFonts.poppins(
              fontSize: size.width * 0.1,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.015),
            child: Text(
              'Welcome Back',
              style: GoogleFonts.poppins(
                fontSize: size.height * 0.025,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          KTextField(
            controller: controller.emailController,
            label: "Email",
            icon: Icons.email,
            validator: (val) => emailValidator(val),
          ),
          KTextField(
            controller: controller.passwordController,
            label: "Password",
            icon: Icons.lock,
            obscureText: true,
            validator: (val) => passwordValidator(val),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.025,
                vertical: size.height * 0.025,
              ),
              child: InkWell(
                onTap: () {
                  //todo navigate to forgot password screen
                },
                child: Text(
                  "Forgot your password?",
                  style: TextStyle(
                    color: const Color(0xffADA4A5),
                    decoration: TextDecoration.underline,
                    fontSize: size.height * 0.02,
                  ),
                ),
              ),
            ),
          ),
          ButtonWidget(
            text: "Login",
            width: size.width * 0.9,
            height: size.height * 0.07,
            backColors:
                MediaQuery.of(context).platformBrightness == Brightness.dark
                    ? [
                        Colors.black,
                        Colors.black,
                      ]
                    : const [
                        Color(0xff92A3FD),
                        Color(0xff9DCEFF),
                      ],
            textColors: [
              Colors.white,
              Colors.white,
            ],
            onPressed: () async => controller.login(),
            borderRadius: 15,
            cooldown: const Duration(seconds: 5),
          ),
          SizedBox(height: 25),
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Don’t have an account yet? ",
                  style: TextStyle(
                    fontSize: size.height * 0.018,
                  ),
                ),
                WidgetSpan(
                  child: InkWell(
                      onTap: () {
                        controller.registerSwitch.value = true;
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(
                          foreground: Paint()
                            ..shader = const LinearGradient(
                              colors: <Color>[
                                Color(0xffEEA4CE),
                                Color(0xffC58BF2),
                              ],
                            ).createShader(
                              const Rect.fromLTWH(
                                0.0,
                                0.0,
                                200.0,
                                70.0,
                              ),
                            ),
                          fontSize: size.height * 0.018,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
