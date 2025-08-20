import 'package:get/get.dart';
import 'package:shalana07/features/auth/presentation/views/login_screen.dart';
import 'package:shalana07/features/auth/presentation/views/signup_screen.dart';
import '../features/bottom_nav_bar/presentation/screens/app_bottom_nav_bar.dart';
import 'package:shalana07/features/onboard_screen/presentation/view/obboarding.dart';


class AppRoute {
  
  static String onboardScreen = "/onboard_screen";
  static String loginScreen = "/loginScreen";
  static String appBottomNavBarScreen = "/appBottomNavBarScreen";
  static String signupScreen= "/signupScreen";

  static String getLoginScreen() => loginScreen;
  static String getSplashScreen() => onboardScreen;
  static String getAppBottomNavBarScreen() => appBottomNavBarScreen;
  static String getSignupScreen() => signupScreen;

  static List<GetPage> routes = [
    GetPage(name: loginScreen, page: () =>  LoginScreen()),
    GetPage(name: onboardScreen, page: () => const OnboardingScreen()),
    GetPage(name: appBottomNavBarScreen, page: () => const AppBottomNavBar()),
    GetPage(name: signupScreen, page: () => const SignupScreen()),
  ];
}
