import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/common_button.dart';
import 'package:shalana07/core/common/widgets/custom_appbar.dart';
import 'package:shalana07/core/services/storage_service.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/core/utils/constants/image_path.dart';
import 'package:shalana07/features/auth/controller/loginController.dart';
import 'package:shalana07/features/auth/model/user_login_model.dart';
import 'package:shalana07/features/auth/presentation/views/login_screen.dart';
import 'package:shalana07/features/bottom_nav_bar/controller/navaber_controller.dart';
import 'package:shalana07/features/home/parent/presentatrion/widgets/account_card.dart';

import 'package:shalana07/features/profile/parent/controller/parent_profile_controller.dart';
import 'package:shalana07/features/profile/parent/presentation/view/Edit_profile_page.dart';
import 'package:shalana07/features/profile/parent/presentation/view/add_child_account.dart';
import 'package:shalana07/features/profile/parent/presentation/view/all_help_update.dart';
import 'package:shalana07/features/profile/parent/presentation/widgets/custom_switch.dart';
import 'package:shalana07/features/profile/parent/presentation/widgets/helper_card.dart';

class ParentProfile extends StatelessWidget {
  ParentProfile({super.key});
  final ParentProfileController controller = Get.put(ParentProfileController());
  final Logincontroller loginController = Get.put(Logincontroller());
  final NavaberController navaberController = Get.put(NavaberController());

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await 500.milliseconds.delay();
      },
      child: Scaffold(
        backgroundColor: AppColors.appBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: CustomAppBar(
            title: "Parent Profile",
            backArrowIcon: navaberController.controller.index == 4
                ? false
                : true,
            notificationIcon: true,
            profileIcon: false,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ////========profile image===========
                Profilesection(controller: controller),
                10.verticalSpace,
                ////////-----------profile details section------------//
                Center(
                  child: Text(
                    "Laurel Lynn",
                    style: getTextStyle(
                      fontSize: 16,
                      color: AppColors.grey900,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                10.verticalSpace,
                Center(
                  child: Text(
                    "Mother",
                    style: getTextStyle(
                      fontSize: 15,
                      color: AppColors.grey500,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                20.verticalSpace,
                ///////////======edit profile button==========//
                CommonButton(
                  height: 40.h,
                  fontSize: 12,

                  textColor: AppColors.grey900,
                  backgroundColor: AppColors.green900,
                  title: "Edit Profile",
                  onPressed: () {
                    Get.to(() => EditProfile());
                  },
                ),

                20.verticalSpace,
                Divider(color: AppColors.grey200),
                24.verticalSpace,
                //linked account section
                Text(
                  'Linked Accounts',
                  style: getTextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                24.verticalSpace,
                Column(
                  children: [
                    ...?controller.parentModel.value?.data.parentProfile.children.
                        map(
                          (child) => LinkAccountCard(
                            name: child.name,
                            relation: child.relation,
                          ).paddingOnly(bottom: 20.h),
                        ),
                  ],
                ),
                20.verticalSpace,

                ///==========add account button==========//
                CommonButton(
                  height: 40.h,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  backgroundColor: Colors.transparent,
                  isbporderColor: true,
                  textColor: AppColors.grey900,
                  title: 'Add Account',
                  onPressed: () {
                    Get.to(() => AddChildAccount());
                  },
                ),

                20.verticalSpace,
                Divider(color: AppColors.grey200),

                20.verticalSpace,
                //////////////////==========update helper button==========//
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Help Updates',
                      style: getTextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => AllHelp());
                      },
                      child: Text(
                        'View All',
                        style: getTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                /////////////==========update helper List==========//
                ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    final activity = controller.messages[index];
                    // Each activity card
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.0.h, // Space between each activity card
                      ),
                      child: HelperCard(activity: activity),
                    );
                  },
                ),

                ///////////setting section////////////////
                Text(
                  'Settings',
                  style: getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                ////=========//notification section////////////
                Obx(() {
                  return Column(
                    children: [
                      10.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _settingTittle('Push Notifications'),
                          CustomToggle(
                            value: controller.pushNotifications.value,
                            onChanged: (value) {
                              controller.pushNotifications.value = value;
                            },
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _settingTittle('Daily Reminders'),
                          CustomToggle(
                            value: controller.dailyReminders.value,
                            onChanged: (value) {
                              controller.dailyReminders.value = value;
                            },
                          ),
                        ],
                      ),

                      10.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _settingTittle('Child Task Updates'),
                          CustomToggle(
                            value: controller.childTaskUpdates.value,
                            onChanged: (value) {
                              controller.childTaskUpdates.value = value;
                            },
                          ),
                        ],
                      ),
                    ],
                  );
                }),

                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        StorageService.logoutUser();
                        Get.offAll(() => LoginScreen());
                      },
                      child: Text(
                        'Log Out',
                        style: getTextStyle(
                          color: const Color(0xFFFF5A5A),
                          fontSize: 12,

                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      'Delete Account',
                      style: getTextStyle(
                        color: const Color(0xFFFF5A5A),
                        fontSize: 12,

                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                50.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text _settingTittle(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: getTextStyle(
        color: const Color(0xFF686868),
        fontSize: 12,

        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class Profilesection extends StatelessWidget {
  const Profilesection({super.key, required this.controller});

  final ParentProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Center(
        child: GestureDetector(
          onTap: () {
            controller.pickImageFromGallery();
          },
          child: Stack(
            children: [
              controller.selectedImagePath.value.isEmpty
                  ? CircleAvatar(
                      radius: 60.r,
                      backgroundImage: AssetImage(ImagePath.parentProfile),
                    )
                  : CircleAvatar(
                      radius: 60.r,
                      backgroundImage: FileImage(
                        File(controller.selectedImagePath.value),
                      ),
                    ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white100,
                  ),
                  child: Image.asset(IconPath.editIcon, scale: 3),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
