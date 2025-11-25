import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/services/storage_service.dart';
import 'package:shalana07/core/utils/logging/logger.dart';
import 'package:shalana07/features/auth/controller/loginController.dart';
import 'package:shalana07/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});



  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final loginController = Get.find<Logincontroller>();
  @override
  void initState() {
    super.initState();
    // Delay 4 seconds then navigate to onboarding
    Future.delayed(const Duration(seconds: 2), () async {
      if (StorageService.isFirstTimer()) {
        Get.offNamed(AppRoute.onboardScreen);
      } else {
        if (StorageService.hasToken()) {
          AppLoggerHelper.debug(StorageService.hasToken().toString());


          loginController.userRole.value = await StorageService.role();
          AppLoggerHelper.debug(loginController.userRole.value.toString());
          Get.offNamed(AppRoute.appBottomNavBarScreen);
        } else {
          Get.offNamed(AppRoute.loginScreen);
        }
      }
      // replaces splash screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.flutter_dash_rounded, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            Text(
              'Shalana App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
