import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/utils/constants/colors.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final bool? isLinearGradient;
  final bool? isbporderColor;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;

  const  CommonButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.isLinearGradient,
    this.isbporderColor, this.height, this.fontSize, this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.grey,
      highlightColor: Colors.greenAccent,
      borderRadius: BorderRadius.circular(24.r),
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: height ?? 50.h,
        decoration: BoxDecoration(
          gradient: isLinearGradient == true ? AppColors.linearGradient : null,
          color: backgroundColor ?? AppColors.primary,
          borderRadius: BorderRadius.circular(24.r),
          border: isbporderColor == true
              ? Border.all(color: AppColors.primary, width: 1.0)
              : null,
        ),
        child: Center(
          child: Text(
            title,
            style: getTextStyle(
              color: textColor ?? Colors.white,
              fontSize: fontSize ?? 18,
              fontWeight:fontWeight ?? FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
