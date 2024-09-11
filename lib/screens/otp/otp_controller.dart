import 'dart:async';

import 'package:get/get.dart';

import '../../constants/route_constants.dart';

class OtpController extends GetxController{

  RxInt secondsRemaining = 60.obs;
  Timer? timer;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void startTimer() {
    timer?.cancel();
    secondsRemaining.value = 60;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        timer?.cancel();
      }
    });
  }

  void resendOtp() {
    if (secondsRemaining.value == 0) {
      startTimer();
      //otp resend logic will come here later
    }
  }

  void verifyOtp(String otp) {
    if(otp.length == 6){
      Get.toNamed(RouteConstants.homeScreen);
    }
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

}