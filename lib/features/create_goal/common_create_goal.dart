import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shalana07/features/auth/controller/loginController.dart';
import 'package:shalana07/features/create_goal/child/presentation/view/child_create_new_goal.dart';
import 'package:shalana07/features/create_goal/parent/presentation/view/parent_create_new_goal.dart';

class CommonCreateGoal extends StatelessWidget {
 CommonCreateGoal({super.key});
  //controller
  final Logincontroller _logincontroller =Get.find<Logincontroller>();

  @override
  Widget build(BuildContext context) {
    // Get the user role from the login controller
    final role = _logincontroller.userRole.value;

    // Return the appropriate widget based on the user role
   if ( role == "parent" ) {
      return  ParentCreateNewGoal(); 
    } else if (role == "child") {
      return ChildCreateNewGoal(); 
    } else {
      return ChildCreateNewGoal(); 
    }
  }
}