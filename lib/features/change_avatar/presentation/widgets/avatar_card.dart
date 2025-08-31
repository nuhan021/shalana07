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
import 'package:shalana07/features/customize_avatar/controllers/customize_avatar_controller.dart';
import 'package:shalana07/features/customize_avatar/presentation/screens/avatar_customize_screen.dart';

class AvatarCard extends StatelessWidget {
  AvatarCard({
    super.key,
    required this.avatarImgUrl,
    required this.currentDressStyle,
    required this.currentJewelryStyle,
    required this.currentHairStyle, required this.index,
  });

  final int index;
  final String avatarImgUrl;
  final String currentDressStyle;
  final String currentJewelryStyle;
  final String currentHairStyle;

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
              AppHelperFunctions.navigateToScreen(context, AvatarCustomizeScreen());
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
                      Image.asset(avatarImgUrl),
                      Image.asset(currentDressStyle),
                      Image.asset(currentJewelryStyle),
                      Image.asset(currentHairStyle),
                    ],
                  )
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
