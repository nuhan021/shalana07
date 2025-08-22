import 'package:flutter/material.dart' ;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shalana07/core/utils/constants/colors.dart';

class AddAndRemove extends StatelessWidget {
  const AddAndRemove({super.key, required this.image, this.onTap});
  final String image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.grey200,
          shape: BoxShape.circle,
        ),
        child: Image.asset(image, width: 25.w, scale: 4),
      ),
    );
  }
}
