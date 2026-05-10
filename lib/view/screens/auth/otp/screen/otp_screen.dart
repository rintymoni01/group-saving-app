import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_saving_app/core/utils/app_colors.dart';
import 'package:group_saving_app/view/common_widgets/custom_button.dart';
import 'package:group_saving_app/view/screens/auth/otp/controller/otp_controller.dart';
import 'package:group_saving_app/view/screens/profile/screen/complete_profile_screen.dart';

class OtpScreen extends StatelessWidget {
  final String email;
  OtpScreen({super.key, required this.email});

  final OtpController controller = Get.put(OtpController());

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
            const SizedBox(height: 20),
            // Wallet Icon
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.account_balance_wallet_outlined,
                color: AppColors.primaryColor,
                size: 32,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'OTP',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Enter your OTP sent to $email',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            
            // OTP Input Fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) => _buildOtpBox(context, index)),
            ),
            
            const SizedBox(height: 40),
            
            // Confirm OTP Button
            CustomButton(
              text: 'Confirm OTP',
              onPressed: () {
                // You can access controller.otp here
                Get.to(() => const CompleteProfileScreen());
              },
              borderRadius: 30,
            ),
            
            const SizedBox(height: 24),
            
            // Back to Email
            TextButton(
              onPressed: () => Get.back(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.arrow_back, size: 16, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text(
                    'Back to Email',
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpBox(BuildContext context, int index) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.fieldBorderColor),
      ),
      child: TextField(
        controller: controller.otpControllers[index],
        focusNode: controller.focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),
        onChanged: (value) {
          if (value.length == 1) {
            if (index < 3) {
              controller.focusNodes[index + 1].requestFocus();
            } else {
              // Auto submit when last digit is entered
              controller.focusNodes[index].unfocus();
              Get.to(() => const CompleteProfileScreen());
            }
          } else if (value.isEmpty && index > 0) {
            controller.focusNodes[index - 1].requestFocus();
          }
        },
      ),
    );
  }
}
