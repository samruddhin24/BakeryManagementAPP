import 'dart:async';

import 'package:get/get.dart';

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

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

}