import 'package:get/get.dart';
import 'package:shalana07/features/auth/presentation/views/login_screen.dart';
import 'package:shalana07/features/onboard_screen/presentation/view/obboarding.dart';

class AppRoute {
  
  static String onboardScreen = "/onboard_screen";
  static String loginScreen = "/loginScreen";

  static String getLoginScreen() => loginScreen;
  static String getSplashScreen() => onboardScreen;

  static List<GetPage> routes = [
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: onboardScreen, page: () => const OnboardingScreen()),
  ];
}
