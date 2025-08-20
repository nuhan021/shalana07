import 'package:get/get.dart';
import 'package:shalana07/features/auth/presentation/views/login_screen.dart';
import '../features/bottom_nav_bar/presentation/screens/app_bottom_nav_bar.dart';

class AppRoute {
  static String loginScreen = "/loginScreen";
  static String appBottomNavBarScreen = "/appBottomNavBarScreen";

  static String getLoginScreen() => loginScreen;
  static String getAppBottomNavBarScreen() => appBottomNavBarScreen;

  static List<GetPage> routes = [
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: appBottomNavBarScreen, page: () => const AppBottomNavBar()),
  ];
}
