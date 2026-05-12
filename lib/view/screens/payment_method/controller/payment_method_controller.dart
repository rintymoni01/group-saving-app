import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodController extends GetxController {
  var isBankFormVisible = false.obs;

  final routingController = TextEditingController();
  final accountController = TextEditingController();

  void toggleBankForm() {
    isBankFormVisible.value = !isBankFormVisible.value;
  }

  bool validateForm() {
    if (routingController.text.isEmpty || accountController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
      return false;
    }
    return true;
  }

  @override
  void onClose() {
    routingController.dispose();
    accountController.dispose();
    super.onClose();
  }
}
