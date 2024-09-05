import 'package:bakery_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final mobileNumber = ''.obs;

  void updateNumber(String value){
    mobileNumber.value = value;
  }

  void login(){
    if (mobileNumber.value.length == 10) {
      // Navigate to OTP page
      Get.toNamed(RouteConstants.otpScreen); // Replace '/otp' with the actual route to your OTP page
    } else {
      // Show error message
      Get.snackbar('Error', 'Please provide a valid number',colorText: Colors.white,backgroundColor: Colors.red,snackPosition: SnackPosition.BOTTOM);
    }
  }
}