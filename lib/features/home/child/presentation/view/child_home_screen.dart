import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/enums.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/features/auth/controller/loginController.dart';
import 'package:shalana07/features/home/child/controllers/child_home_screen_controller.dart';
import 'package:shalana07/features/home/child/presentation/widgets/child_tasks.dart';
import 'package:shalana07/features/home/child/presentation/widgets/home_child_avatar.dart';
import 'package:shalana07/features/notification/child/presentation/view/child_notification_page.dart';
import 'package:shalana07/features/profile/child/controller/child_profile_controller.dart';
import 'package:shalana07/features/profile/child/presentation/view/child_profile.dart';
import 'package:shalana07/features/store/controller/store_controller.dart';

import '../../../../../core/utils/constants/image_path.dart';
import '../../../../../core/utils/helpers/app_helper.dart';

class ChildHomeScreen extends StatefulWidget {
  ChildHomeScreen({super.key});

  @override
  State<ChildHomeScreen> createState() => _ChildHomeScreenState();
}

class _ChildHomeScreenState extends State<ChildHomeScreen> {
  final ChildProfileController childProfileController = Get.put(
    ChildProfileController(),
  );

  final ChildHomeScreenController controller = Get.put(ChildHomeScreenController());

  final Logincontroller loginController = Get.put(Logincontroller());

  final StoreController storeController = Get.put(StoreController());

  @override
  void initState() {
    super.initState();
    storeController.getStoreItems(itemName: StoreItems.trending);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.primary,
      onRefresh: () async {
        await childProfileController.getUserData();
      },
      child: Obx(() {
        if (childProfileController.isChildProfileLoading.value) {
          return Center(child: LoadingAnimationWidget.dotsTriangle(color: AppColors.primary, size: 25.h));
        }

        if (childProfileController.isChildProfileError.value) {
          return Center(
            child: TextButton(
              onPressed: () {
                childProfileController.getUserData();
                controller.getChildGoals();
              },
              child: Text(
                'Error!\nTry again',
                textAlign: TextAlign.center,
                style: getTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.error,
                ),
              ),
            ),
          );
        }
        return Scaffold(
          backgroundColor: AppColors.appBackground,
          extendBodyBehindAppBar: true,
          // appbar
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: false,
            title: GestureDetector(
              onTap: () {
                AppHelperFunctions.navigateToScreen(context, ChildProfile());
              },
              child: Container(
                height: 34.r,
                width: 34.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
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
            ),

            actions: [
              InkWell(
                onTap: () {
                  AppHelperFunctions.navigateToScreen(
                    context,
                    ChildNotificationPage(),
                  );
                },
                child: Container(
                  height: 35.h,
                  width: 35.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),

                  alignment: Alignment.center,
                  child: Image.asset(
                    IconPath.notificationIcon,
                    color: AppColors.primary,
                  ),
                ).paddingOnly(right: 16),
              ),
            ],
          ),

          body: Stack(
            children: [
              // avatar section
              Column(
                children: [
                  // avatar
                  HomeChildAvatar(),
                  Expanded(child: SizedBox()),
                ],
              ),

              // child task
              ChildTasks(controller: controller,),
            ],
          ),
        );
      }),
    );
  }
}
