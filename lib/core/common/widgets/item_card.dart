import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/core/utils/constants/image_path.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.coin,
  });

  final String imgUrl;
  final String title;
  final String coin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 215.h,
      width: 160.w,
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.20),
            offset: const Offset(0, 0),
            blurRadius: 6,
            spreadRadius: 0,
          ),
        ],
        borderRadius: BorderRadius.circular(16.r),
      ),
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // image
          ClipRRect(borderRadius: BorderRadius.circular(8.r),child: Image.asset(imgUrl)),

          // title
          Text(title, style: getTextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.grey900
          ), overflow: TextOverflow.ellipsis,),

          const SizedBox(height: 5,),

          // coin and unlock buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // coin button
              Container(
                height: 24.h,
                width: 60.w,
                padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 3.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: AppColors.primary,
                    width: 0.5
                  )
                ),
                
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // coin
                    Text(coin, style: getTextStyle(fontSize: 12, fontWeight: FontWeight.w600),),
                    
                    // coin icon
                    Image.asset(IconPath.earnCoinIcon)
                  ],
                ),
              ),

              // unlock button
              Container(
                height: 24.h,
                width: 60.w,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                    borderRadius: BorderRadius.circular(16.r),
                ),

                alignment: Alignment.center,
                child: Text('Unlock', style: getTextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                ),),
              )
            ],
          )
        ],
      ),
    ).paddingAll(5.r);
  }
}
