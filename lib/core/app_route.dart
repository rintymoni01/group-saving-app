import 'package:get/get.dart';
import 'package:group_saving_app/view/screens/auth/screen/sign_up_screen.dart';
import 'package:group_saving_app/view/screens/splash/screen/splash_screen.dart';

class AppRoute {
  static const String splash = '/splash';
  static const String signUp = '/sign_up';

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: signUp, page: () => const SignUpScreen()),
  ];
}
