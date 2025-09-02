import 'package:flutter/material.dart' show TextEditingController, Colors;
import 'package:get/get.dart';
import 'package:shalana07/routes/app_routes.dart';

class Logincontroller extends GetxController {
  //obsecure text for password field
  var isObscure = true.obs;
  void togglePasswordVisibility() {
    isObscure.value = !isObscure.value;
  }

  // Hardcoded credentials
  final String parentEmail = "parent@gmail.com";
  final String parentPass = "1234";

  final String childEmail = "child@gmail.com";
  final String childPass = "1234";

  var userRole = "".obs; // parent / child
  // Text controllers for email and password fields
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //login function to check credentials and navigate
  void login() {
    final email = emailController.text.trim();
    final pass = passwordController.text.trim();
    // navigate to parent dashboard
    if (email == parentEmail && pass == parentPass) {
      userRole.value = "parent";
      Get.offAllNamed(AppRoute.getAppBottomNavBarScreen());
    }
    // Navigate to child dashboard
    else if (email == childEmail && pass == childPass) {
      userRole.value = "child";
      Get.offAllNamed(AppRoute.getAppBottomNavBarScreen());
    }
    // Navigate to child dashboard
    else if (email.isEmpty || pass.isEmpty) {
      // fallback: if credentials wrong, still log in as child
      userRole.value = "child";
      Get.toNamed(AppRoute.getAppBottomNavBarScreen());
    } else {
      Get.snackbar(
        "Login Failed",
        "Invalid email or password",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.withOpacity(0.5),
        colorText: Colors.white,
      );
      return;
    }
    Get.snackbar(
      "Login Status",
      userRole.value == "parent" ? "Logged in as Parent" : "Logged in as Child",
      snackPosition: SnackPosition.TOP,
    );
  }

  
 

}
