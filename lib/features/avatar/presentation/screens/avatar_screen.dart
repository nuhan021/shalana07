import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/item_card.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/core/utils/constants/image_path.dart';
import 'package:shalana07/core/utils/helpers/app_helper.dart';
import 'package:shalana07/features/avatar/controllers/controller.dart';
import 'package:shalana07/features/avatar/presentation/widgets/show_image.dart';
import 'package:shalana07/features/change_avatar/presentation/screens/change_avatar_screen.dart';
import 'package:shalana07/features/customize_avatar/presentation/screens/avatar_customize_screen.dart';
import 'package:shalana07/features/notification/child/presentation/view/child_notification_page.dart';
import 'package:shalana07/features/profile/child/controller/child_profile_controller.dart';
import 'package:shalana07/features/profile/child/presentation/view/child_profile.dart';

import '../../../bottom_nav_bar/controller/navaber_controller.dart';
import '../../../customize_avatar/controllers/customize_avatar_controller.dart';

class AvatarScreen extends StatelessWidget {
  AvatarScreen({super.key});

  AvatarScreenController avatarScreenController = Get.put(
    AvatarScreenController(),
  );

  final controller = Get.put(CustomizeAvatarController());
  final ChildProfileController childProfileController = Get.put(ChildProfileController());
  NavaberController navaberController = Get.find<NavaberController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground, // default color
      // App Bar of this screen
      appBar: AppBar(
        centerTitle: false,

        title: Text(
          // title of the screen
          'Avatar',
          style: getTextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.grey900,
          ),
        ),

        actions: [
          // notification icon button
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChildNotificationPage(),
                ),
              );
            },
            child: Image.asset(
              IconPath.notificationIcon,
              height: 32.h,
              color: AppColors.grey900,
            ),
          ),

          SizedBox(width: 10.w),

          // profile picture
          GestureDetector(
            onTap: () {
              AppHelperFunctions.navigateToScreen(context, ChildProfile());
            },
            child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CachedNetworkImage(
                    imageUrl:
                        childProfileController
                            .childModel
                            .value
                            ?.data
                            .childProfile
                            .image ??
                        "https://e7.pngegg.com/pngimages/84/165/png-clipart-united-states-avatar-organization-information-user-avatar-service-computer-wallpaper-thumbnail.png",
                    width: 34.r, // ✅ .r
                    height: 34.r, // ✅ .r
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: LoadingAnimationWidget.staggeredDotsWave(
                        color: AppColors.primary,
                        size: 25.h,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
          ),
          ),
        ],
      ),

      // body of the screen
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // child avatar picture container
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: AppColors.primary, width: 10),
              ),
              alignment: Alignment.bottomCenter,
              child: Obx(() {
                if(avatarScreenController.isCurrentAvatarIsLoading.value) return LoadingAnimationWidget.dotsTriangle(color: AppColors.primary, size: 24.h);
                if(avatarScreenController.isCurrentAvatarIsError.value) return Center(child: IconButton(onPressed: () => avatarScreenController.getCurrentAvatar(), icon: Icon(Icons.refresh)),);
                final item = avatarScreenController.currentAvatar.value!.data.equipped;

                String getElementUrl(dynamic elementData) {
                  if (elementData?.elements != null &&
                      elementData!.elements!.isNotEmpty &&
                      elementData.elements!.first.colors != null &&
                      elementData.elements!.first.colors.isNotEmpty) {
                    return elementData.elements!.first.colors.first.url ?? '';
                  }
                  return '';
                }

                return Stack(
                  alignment: Alignment.center,
                  children: [
                    // Avatar base image
                    if (item.avatarImgUrl?.isNotEmpty ?? false)
                      ShowImage(image: item.avatarImgUrl!),

                    // Dress
                    if (getElementUrl(item.dress).isNotEmpty)
                      ShowImage(image: getElementUrl(item.dress)),

                    if (getElementUrl(item.jewelry).isNotEmpty)
                      ShowImage(image: getElementUrl(item.jewelry)),

                    // Hair
                    if (getElementUrl(item.hair).isNotEmpty)
                      ShowImage(image: getElementUrl(item.hair)),

                    if(item.avatarImgUrl.isEmpty || getElementUrl(item.dress).isEmpty || getElementUrl(item.jewelry).isEmpty || getElementUrl(item.hair).isEmpty)
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
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
                      ),
                  ],
                );
              }),
            ),

            SizedBox(height: 30),

            // navigator buttons
            for (int i = 0; i < 2; i++)
              GestureDetector(
                onTap: () {
                  if (i == 1) {
                    AppHelperFunctions.navigateToScreen(
                      context,
                      AvatarCustomizeScreen(avatarId: avatarScreenController.currentAvatar.value!.data.equipped.avatarId,),
                    );
                  } else {
                    AppHelperFunctions.navigateToScreen(
                      context,
                      ChangeAvatarScreen(),
                    );
                  }
                },
                child: Container(
                  height: 52.h,
                  width: double.maxFinite,
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.06),
                        offset: const Offset(0, 2),
                        blurRadius: 6,
                        spreadRadius: 0,
                      ),
                    ],
                    border: Border.all(color: AppColors.grey200),
                  ),

                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Screen name
                      Text(
                        i == 0 ? 'Change Avatar' : 'Customize Avatar',
                        style: getTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.grey900,
                        ),
                      ),

                      // arrow icon
                      Image.asset(IconPath.arrowForwardIcon, height: 20.h),
                    ],
                  ),
                ).paddingOnly(bottom: 20),
              ),

            // Trending items section
            SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // top section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // title
                      Text(
                        'Trending Items',
                        style: getTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      // see all button
                      TextButton(
                        onPressed: () {navaberController.jumpToScreen(3);},
                        child: Text(
                          'See All',
                          style: getTextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey700,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // item section
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: avatarScreenController.trendingItems.map((
                        element,
                      ) {
                        return ItemCard(
                          imgUrl: element.imgUrl,
                          title: element.title,
                          coin: element.coin,
                        ).marginOnly(right: 10.r);
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
          ],
        ).paddingSymmetric(horizontal: 15.r),
      ),
    );
  }
}
