import 'package:get/get.dart';
import 'package:shalana07/features/auth/presentation/views/forget_password.dart';
import 'package:shalana07/features/auth/presentation/views/login_screen.dart';
import 'package:shalana07/features/auth/presentation/views/otp_page.dart';
import 'package:shalana07/features/auth/presentation/views/set_new_password.dart';
import 'package:shalana07/features/auth/presentation/views/signup_screen.dart';
import '../features/bottom_nav_bar/presentation/screens/app_bottom_nav_bar.dart';
import 'package:shalana07/features/onboard_screen/presentation/view/obboarding.dart';

import '../features/splash/presentation/views/splash_screen.dart';

class AppRoute {
  static String splashScreen = "/splash_screen";
  static String onboardScreen = "/onboard_screen";
  static String loginScreen = "/loginScreen";
  static String appBottomNavBarScreen = "/appBottomNavBarScreen";
  static String signupScreen= "/signupScreen";
  static String  forgotPasswordScreen = "/forgotPasswordScreen";
  static String forgetOTPScreen = "/otpScreen";
  static String setNewPasswordScreen = "/setNewPasswordScreen";

  static String getLoginScreen() => loginScreen;
  static String getSplashScreen() => onboardScreen;
  static String getAppBottomNavBarScreen() => appBottomNavBarScreen;
  static String getSignupScreen() => signupScreen;
  static String getForgotPasswordScreen() => forgotPasswordScreen;
  static String getForgetOTPScreen() => forgetOTPScreen;
  static String getSetNewPasswordScreen() => setNewPasswordScreen;

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: loginScreen, page: () =>  LoginScreen()),
    GetPage(name: onboardScreen, page: () => const OnboardingScreen()),
    GetPage(name: appBottomNavBarScreen, page: () => const AppBottomNavBar()),
    GetPage(name: signupScreen, page: () =>  SignupScreen()),
    GetPage(name: forgotPasswordScreen, page: () => const ForgetPassword()),
    GetPage(name: forgetOTPScreen, page: () =>  OtpPage()),
    GetPage(name: setNewPasswordScreen, page: () => const SetNewPassword()),
  ];
}
