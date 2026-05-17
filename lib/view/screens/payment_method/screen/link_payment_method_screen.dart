import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_saving_app/core/utils/app_colors.dart';
import 'package:group_saving_app/view/screens/payment_method/controller/payment_method_controller.dart';
import 'package:group_saving_app/view/widgets/custom_button.dart';
import 'package:group_saving_app/view/widgets/custom_text_field.dart';

class LinkPaymentMethodScreen extends StatelessWidget {
  LinkPaymentMethodScreen({super.key});

  final PaymentMethodController controller = Get.put(PaymentMethodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() => SingleChildScrollView(
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
            Text(
              'Link your payment method',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Add a bank account or card for\nautomatic contributions',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            if (!controller.isBankFormVisible.value) ...[
              _buildPaymentOption(
                icon: Icons.account_balance_outlined,
                title: 'Link Bank Account',
                onTap: () => controller.toggleBankForm(),
              ),
              const SizedBox(height: 16),
              _buildPaymentOption(
                icon: Icons.credit_card_outlined,
                title: 'Add Debit/Credit Card',
                onTap: () {},
              ),
              const SizedBox(height: 24),
              // Security Note
              _buildSecurityNote(),
            ] else ...[
              _buildBankForm(),
            ],
            const SizedBox(height: 32),
            CustomButton(
              text: 'Skip for now',
              onPressed: () {},
              color: Colors.grey.shade200,
              textColor: Colors.black,
              borderRadius: 12,
            ),
            const SizedBox(height: 24),
          ],
        ),
      )),
    );
  }

  Widget _buildSecurityNote() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.lock, size: 18, color: Color(0xFF1A237E)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Your banking information is encrypted and secure. We use bank-level security to protect your data.',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBankForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Link Bank Account',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 24),
        CustomTextField(
          label: 'Routing Number',
          hintText: 'Enter 9-digit routing number',
          controller: controller.routingController,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          label: 'Account Number',
          hintText: 'Enter account number',
          controller: controller.accountController,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
        ),
        const SizedBox(height: 32),
        Row(
          children: [
            Expanded(
              child: Obx(() => CustomButton(
                text: 'Link Account',
                isLoading: controller.isLoading.value,
                onPressed: () => controller.linkAccount(),
                borderRadius: 12,
              )),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomButton(
                text: 'Cancel',
                onPressed: () => controller.toggleBankForm(),
                color: Colors.grey.shade200,
                textColor: Colors.black,
                borderRadius: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        _buildSecurityNote(),
      ],
    );
  }

  Widget _buildPaymentOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Icon(Icons.add, color: Colors.grey.shade400),
          ],
        ),
      ),
    );
  }
}
