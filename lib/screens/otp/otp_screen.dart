import 'package:bakery_app/screens/screens.dart';
import 'package:bakery_app/widgets/custom_button.dart';
import 'package:bakery_app/widgets/custom_otp_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_constants.dart';
import '../../constants/route_constants.dart';
import 'otp_controller.dart';

class OtpScreen extends StatelessWidget {
  final OtpController otpController = Get.put(OtpController());
  String enteredOtp = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppConstants.otpHeading,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                AppConstants.otpSubHeading,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(
                height: 40,
              ),
               CustomOtpField(
                length: 6,
                onOtpEntered: (otp){
                  enteredOtp = otp;
                },
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButton(text: AppConstants.verifyBtn,
                  onPressed: () {
                    if(enteredOtp.length == 6){
                      Get.toNamed(RouteConstants.homeScreen);
                    }else{
                      Get.snackbar(
                        "Invalid OTP",
                        "Please enter all 6 digits of the OTP.",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                //otp verification logic to be implemented here
              }),
              const SizedBox(height: 20,),
              Obx((){
                return Text(
                  otpController.secondsRemaining.value > 0
                      ? "Resend OTP in ${otpController.secondsRemaining.value}s"
                      : "Didn't receive OTP? ",
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                );
              }),
              Obx(() {
                return otpController.secondsRemaining.value == 0
                    ? TextButton(
                  onPressed: () {
                    otpController.resendOtp();
                  },
                  child: const Text(
                    'Resend',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                )
                    : const SizedBox.shrink();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
