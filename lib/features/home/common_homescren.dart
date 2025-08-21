import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalana07/features/auth/controller/loginController.dart';
import 'package:shalana07/features/home/child/presentation/view/child_home_screen.dart';
import 'package:shalana07/features/home/parent/presentatrion/view/parent_homescreen.dart';


class CommonHomeScreen extends StatelessWidget {
  const CommonHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<Logincontroller>();

    return Obx(() {
      final role = loginController.userRole.value;

      // ternary condition
      if (role == "parent") {
        return  ParentHomescreen();
      } else if (role == "child") {
        return const ChildHomeScreen();
      } else {
         return const ChildHomeScreen();
      }
    });
  }
}
