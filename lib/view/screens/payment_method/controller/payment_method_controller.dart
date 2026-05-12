import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodController extends GetxController {
  var isBankFormVisible = false.obs;

  final routingController = TextEditingController();
  final accountController = TextEditingController();

  void toggleBankForm() {
    isBankFormVisible.value = !isBankFormVisible.value;
  }

  var isLoading = false.obs;

  bool validateForm() {
    if (routingController.text.isEmpty || accountController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
      return false;
    }
    return true;
  }

  void linkAccount() async {
    if (validateForm()) {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2));
      isLoading.value = false;
      Get.snackbar('Success', 'Bank account linked successfully');
      toggleBankForm();
    }
  }

  @override
  void onClose() {
    routingController.dispose();
    accountController.dispose();
    super.onClose();
  }
}
