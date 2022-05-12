import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/utils/regexp.dart';
import '../../widgets/build_snack_error.dart';
import '../../widgets/button.dart';
import '../../widgets/k_text_field.dart';
import '../controllers/auth_controller.dart';

class RegisterView extends GetWidget<AuthController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "Hey there",
            style: GoogleFonts.poppins(
              fontSize: size.width * 0.1,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.015),
            child: Text(
              'Create an Account ?',
              style: GoogleFonts.poppins(
                fontSize: size.height * 0.025,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          KTextField(
            controller: controller.nameController,
            label: "Name",
            icon: Icons.person_outlined,
            validator: (val) => val.isEmpty ? 'Please enter a name' : null,
          ),
          KTextField(
            controller: controller.emailController,
            label: "Email",
            icon: Icons.email,
            validator: (val) => emailValidator(val),
          ),
          KTextField(
            controller: controller.rePasswordController,
            label: "Passsword",
            icon: Icons.lock,
            obscureText: true,
            validator: (val) => passwordValidator(val),
          ),
          KTextField(
            controller: controller.passwordController,
            label: "Confirm Password",
            icon: Icons.lock,
            obscureText: true,
            validator: (val) => val != controller.passwordController.text
                ? "Passwords don't match"
                : null,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.015,
              vertical: size.height * 0.025,
            ),
            child: Obx(
              () => CheckboxListTile(
                title: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "By creating an account, you agree to our ",
                        style: TextStyle(
                          color: const Color(0xffADA4A5),
                          fontSize: size.height * 0.015,
                        ),
                      ),
                      WidgetSpan(
                        child: Text(
                          "Terms of Use and Privacy Notice",
                          style: TextStyle(
                            color: const Color(0xffADA4A5),
                            decoration: TextDecoration.underline,
                            fontSize: size.height * 0.015,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                activeColor: const Color(0xff7B6F72),
                value: controller.checkedValue.value,
                onChanged: (newValue) {
                  controller.checkedValue.value = newValue!;
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
          ),
          ButtonWidget(
            text: "Register",
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
            onPressed: () async {
              if (!controller.checkedValue.value) {
                buildSnackError(
                  'Accept our Privacy Policy and Term Of Use',
                );
                controller.register();
              }
            },
            borderRadius: 15,
            cooldown: const Duration(seconds: 5),
          ),
          SizedBox(height: 25),
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(
                    fontSize: size.height * 0.018,
                  ),
                ),
                WidgetSpan(
                  child: InkWell(
                      onTap: () {
                        controller.registerSwitch.value = false;
                      },
                      child: Text(
                        "Login",
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
