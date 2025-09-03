import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalana07/features/auth/controller/loginController.dart';
import 'package:shalana07/features/avatar/presentation/screens/avatar_screen.dart';
import 'package:shalana07/features/profile/parent/presentation/view/parent_profile_screen.dart';

class CommonAvatarScreen extends StatelessWidget {
  const CommonAvatarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<Logincontroller>();

    return Obx(() {
      final role = loginController.userRole.value;

      if (role == "parent") {
        return ParentProfile();
      } else if (role == "child") {
        return AvatarScreen();
      } else {
        // fallback just in case
        return AvatarScreen();
      }
    });
  }
}
