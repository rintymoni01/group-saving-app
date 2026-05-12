import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_saving_app/view/screens/payment_method/controller/payment_method_controller.dart';

class LinkPaymentMethodScreen extends StatelessWidget {
  const LinkPaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Wallet Icon
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1A237E).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.account_balance_wallet_outlined,
                color: Color(0xFF1A237E),
                size: 32,
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
