import 'package:get/get.dart';

class PaymentMethodController extends GetxController {
  var isBankFormVisible = false.obs;

  void toggleBankForm() {
    isBankFormVisible.value = !isBankFormVisible.value;
  }
}
