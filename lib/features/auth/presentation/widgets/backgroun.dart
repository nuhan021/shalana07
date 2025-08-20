import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/utils/constants/image_path.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImagePath.login,
      fit: BoxFit.cover,
      height: Get.height / 2,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }
}
