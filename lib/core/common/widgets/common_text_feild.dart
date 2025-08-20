import 'package:flutter/material.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/utils/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Widget? suffixIcons;
  final bool? isfilled;

  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.suffixIcons,
    this.isfilled,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        filled: isfilled ?? false,
        fillColor: isfilled == true ? AppColors.white100: Colors.transparent,
        hintStyle: getTextStyle(
          color: AppColors.grey300,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: suffixIcons,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(width: 0.5, color: Colors.grey.shade600),
        ),
      ),
    );
  }
}
