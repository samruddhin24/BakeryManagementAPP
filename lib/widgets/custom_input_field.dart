import 'dart:ui';

import 'package:bakery_app/constants/constants.dart';
import 'package:bakery_app/screens/registration/registration_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final bool isEmail;
  final String? Function(String?)? validator;
  // final RegistrationScreenController registrationController =
  //     Get.find<RegistrationScreenController>();

  CustomInputField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.isEmail = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              textAlign: TextAlign.start,
              keyboardType:
                  isEmail ? TextInputType.emailAddress : TextInputType.text,
              style: const TextStyle(
                fontSize: 16,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                contentPadding: const EdgeInsets.fromLTRB(16, 15, 10, 15),
                border: InputBorder.none,
              ),
              validator: validator,
              // validator: (value) {
              //   if (isEmail) {
              //     return registrationController.validateEmail(value);
              //   } else {
              //     return registrationController.validateUserName(value);
              //   }
              // },
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(
              icon,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
