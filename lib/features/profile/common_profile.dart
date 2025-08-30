import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalana07/features/auth/controller/loginController.dart';
import 'package:shalana07/features/profile/child/presentation/view/child_profile.dart';
import 'package:shalana07/features/profile/parent/presentation/view/parent_profile_screen.dart';

class CommonProfile extends StatelessWidget {
 CommonProfile({super.key});
  final _logincontroller = Get.find<Logincontroller>();

  @override
  Widget build(BuildContext context) {
    // Get the user role from the login controller
  final role = _logincontroller.userRole.value;
  if (role == "parent") {
    return  ParentProfile(); 
  } else if (role == "child") {
    return ChildProfile(); 
  } else {
    return ChildProfile(); 
  }
  }
}