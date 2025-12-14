import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/services/storage_service.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/core/utils/helpers/app_helper.dart';
import 'package:shalana07/features/avatar/presentation/widgets/show_image.dart';
import 'package:shalana07/features/customize_avatar/controllers/customize_avatar_controller.dart';
import 'package:shalana07/features/customize_avatar/presentation/screens/avatar_customize_screen.dart';

class AvatarCard extends StatelessWidget {
  AvatarCard({
    super.key,
    required this.avatarImgUrl,
    required this.currentDressStyle,
    required this.currentJewelryStyle,
    required this.currentHairStyle,
    required this.index,
    required this.id,
  });

  final int index;
  final String avatarImgUrl;
  final String currentDressStyle;
  final String currentJewelryStyle;
  final String currentHairStyle;
  final String id;

  CustomizeAvatarController controller = Get.put(CustomizeAvatarController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.h,
      width: 165.w,
      padding: EdgeInsets.all(5.r),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10.r),
      ),

      child: Column(
        children: [
          // avatar image
          GestureDetector(
            onTap: () {
              StorageService.saveCurrentAvatar(index.toString());
              controller.totalElements.value = controller.avatars[index];
              controller.resetAll();
              AppHelperFunctions.navigateToScreen(
                context,
                AvatarCustomizeScreen(avatarId: id,),
              );
            },
            child: Container(
              height: 123.h,
              width: 157.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.r),
              ),

              child: SizedBox(
                height: 270.h,
                width: double.maxFinite,

                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (avatarImgUrl.isNotEmpty)
                      ShowImage(image: avatarImgUrl),

                    if (currentDressStyle.isNotEmpty)
                      ShowImage(image: currentDressStyle),
                    
                    if(currentJewelryStyle.isNotEmpty)
                      ShowImage(image: currentJewelryStyle),

                    if (currentHairStyle.isNotEmpty)
                      ShowImage(image: currentHairStyle),

                    // Glassmorphism overlay - যদি কোনো data missing থাকে
                    if (avatarImgUrl.isEmpty ||
                        currentDressStyle.isEmpty ||
                        currentHairStyle.isEmpty)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.r),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            height: double.maxFinite,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white.withOpacity(0.2),
                                  Colors.white.withOpacity(0.1),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(6.r),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3),
                                width: 1.5,
                              ),
                            ),
                            child: Center(
                              child: Container(
                                padding: EdgeInsets.all(12.r),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.4),
                                    width: 2,
                                  ),
                                ),
                                child: Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 32,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),

          10.verticalSpace,

          // coin and unlock button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // coin
              Container(
                height: 22.h,
                width: 70.w,
                padding: EdgeInsets.symmetric(horizontal: 6.r, vertical: 2.r),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(16.r),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '500',
                      style: getTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),

                    6.horizontalSpace,

                    Image.asset(IconPath.earnCoinIcon),
                  ],
                ),
              ),

              // unlock
              Container(
                height: 22.h,
                width: 70.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),

                alignment: AlignmentGeometry.center,

                child: Text(
                  'Unlock',
                  style: getTextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
