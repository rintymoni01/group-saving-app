import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_saving_app/core/utils/app_colors.dart';
import 'package:group_saving_app/view/screens/auth/sign_up/screen/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Group Saving App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      home: const SignUpScreen(),
    );
  }
}
