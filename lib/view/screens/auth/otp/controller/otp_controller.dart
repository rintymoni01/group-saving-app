import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final List<TextEditingController> otpControllers = List.generate(4, (index) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());
  
  var secondsRemaining = 60.obs;
  var canResend = false.obs;
  Timer? timer;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void startTimer() {
    secondsRemaining.value = 60;
    canResend.value = false;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        canResend.value = true;
        t.cancel();
      }
    });
  }

  void resendOtp() {
    if (canResend.value) {
      startTimer();
      // Logic to resend OTP
      Get.snackbar('Success', 'OTP Resent successfully!');
    }
  }

  String get otp => otpControllers.map((e) => e.text).join();

  @override
  void onClose() {
    timer?.cancel();
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.onClose();
  }
}
