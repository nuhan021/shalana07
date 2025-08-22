import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalana07/features/auth/controller/loginController.dart';
import 'package:shalana07/features/daily_goal/child/presentaiton/view/child_daily_goal.dart';
import 'package:shalana07/features/daily_goal/parent/presentation/view/parent_daily_goal.dart';

class CommonDailyGoal extends StatelessWidget {
   CommonDailyGoal({super.key});
  final Logincontroller  _logincontroller = Get.find<Logincontroller>();

  @override
  Widget build(BuildContext context) {
    // Get the user role from the login controller
    final role = _logincontroller.userRole.value;
    if (role == "parent") {
      return  ParentDailyGoal(); 
    } else if (role == "child") {
      return ChildDailyGoal(); 
    } else {
      return ChildDailyGoal(); 
    }
  }
}