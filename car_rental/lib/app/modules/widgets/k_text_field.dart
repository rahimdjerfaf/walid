import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Function(String)? onSubmitted;
  final TextEditingController? controller;
  final FormFieldValidator? validator;

  final IconData icon;
  KTextField({
    Key? key,
    required this.label,
    required this.icon,
    this.hint,
    this.keyboardType,
    this.obscureText = false,
    this.onSubmitted,
    this.controller,
    this.validator,
  }) : super(key: key);
  final pwVisible = false.obs;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Obx(
          () => TextFormField(
              controller: controller,
              obscureText: obscureText || pwVisible.value,
              validator: validator,
              onFieldSubmitted: onSubmitted,
              keyboardType: keyboardType,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: label,
                  hintText: hint,
                  prefixIcon: Icon(
                    icon,
                    color: const Color(0xff7B6F72),
                  ),
                  suffixIcon: obscureText
                      ? IconButton(
                          icon: Icon(
                            pwVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xff7B6F72),
                          ),
                          onPressed: () {
                            pwVisible.value = !pwVisible.value;
                          },
                        )
                      : null)),
        ),
      ),
    );
  }
}
