import 'package:get/get.dart';
import 'package:shalana07/features/auth/presentation/views/login_screen.dart';

class AppRoute {
  static String loginScreen = "/loginScreen";

  static String getLoginScreen() => loginScreen;

  static List<GetPage> routes = [
    GetPage(name: loginScreen, page: () => const LoginScreen()),
  ];
}
