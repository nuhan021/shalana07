// child_profile.dart (updated)
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/common_button.dart';
import 'package:shalana07/core/common/widgets/custom_child_app_bar.dart';
import 'package:shalana07/core/services/storage_service.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/features/auth/presentation/views/login_screen.dart';
import 'package:shalana07/features/profile/child/controller/child_profile_controller.dart';
import 'package:shalana07/features/profile/child/presentation/view/child_edit_profile.dart'; // Make sure this is imported
import 'package:shalana07/features/profile/child/presentation/widget/profilepicture.dart';
import 'package:shalana07/features/profile/child/presentation/widget/weekily_overview.dart';
import 'package:shalana07/features/profile/parent/presentation/widgets/custom_switch.dart';

class ChildProfile extends StatelessWidget {
  ChildProfile({super.key});
  final ChildProfileController controller = Get.put(ChildProfileController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _calculateAge(DateTime birthDate) {
    final today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd MMMM, yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await controller.getUserData();
      },
      child: Scaffold(
        backgroundColor: AppColors.appBackground,
        key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: CustomChildAppBar(title: 'Profile', isAvatarVisible: false),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Obx(() {
            if (controller.isChildProfileLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            final model = controller.childModel.value;
            if (model == null) {
              return const Center(child: Text('Failed to load profile.'));
            }

            final childProfile = model.data.childProfile;
            final String formattedDob = _formatDate(childProfile.dateOfBirth);
            final String age = '${_calculateAge(childProfile.dateOfBirth)} years';
            final String email = childProfile.email;
            final String earnedCoins = childProfile.coins.toString();
            final String completedTasks = '15';
            final String activeTasks = '12';

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Profilepicture(controller: controller),
                  10.verticalSpace,
                  Center(
                    child: Text(
                      childProfile.name,
                      style: getTextStyle(
                        fontSize: 18,
                        color: AppColors.grey900,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  20.verticalSpace,
                  CommonButton(
                    textColor: AppColors.grey900,
                    backgroundColor: AppColors.green900,
                    title: "Edit Profile",
                    fontSize: 14,
                    onPressed: () {
                      Get.to(() => ChildEditProfile(model: model));
                    },
                  ),
                  20.verticalSpace,
                  Row(
                    children: [
                      Text(
                        'Weekly Overview',
                        style: getTextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.grey900,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          _scaffoldKey.currentState!.openEndDrawer();
                        },
                        child: Image.asset(
                          IconPath.filterIcon,
                          color: AppColors.grey900,
                          height: 25.h,
                          width: 25.w,
                        ),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: WeeeklyOVerview(title: 'Completed Task', sub: completedTasks),
                      ),
                      10.horizontalSpace,
                      Expanded(
                        child: WeeeklyOVerview(title: 'Active Task', sub: activeTasks),
                      ),
                      10.horizontalSpace,
                      Expanded(
                        child: WeeeklyOVerview(title: 'Earn Coin', sub: earnedCoins),
                      ),
                    ],
                  ),
                  30.verticalSpace,
                  Text(
                    'Basic Information',
                    style: getTextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  20.verticalSpace,
                  _buildInfromation('Date of Birth', formattedDob),
                  20.verticalSpace,
                  _buildInfromation("Age", age),
                  20.verticalSpace,
                  _buildInfromation('Email', email),
                  20.verticalSpace,
                  Row(
                    children: [
                      Text(
                        "Push Notification",
                        style: getTextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey500,
                        ),
                      ),
                      Spacer(),
                      Obx(() {
                        return CustomToggle(
                          value: controller.toggle.value,
                          onChanged: (value) {
                            controller.toggle.value = value;
                          },
                        );
                      }),
                    ],
                  ),
                  30.verticalSpace,
                  InkWell(
                    onTap: () {
                      Get.defaultDialog(
                        title: "Log Out",
                        content: Text(
                          "Are you sure you want to logout?",
                          style: getTextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey500,
                          ),
                        ),
                        actions: [
                          CommonButton(
                            textColor: Colors.white,
                            backgroundColor: AppColors.danger,
                            title: "Log Out",
                            fontSize: 14,
                            onPressed: () async {
                              await StorageService.logoutUser();
                              Get.offAll(() => LoginScreen());
                            },
                          ),
                          CommonButton(
                            textColor: AppColors.grey900,
                            backgroundColor: AppColors.primary,
                            title: "Cancel",
                            fontSize: 14,
                            onPressed: () => Get.back(),
                          ),
                        ],
                      );
                    },
                    child: Text(
                      'Log Out',
                      style: getTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.danger,
                      ),
                    ),
                  ),
                  50.verticalSpace,
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Row _buildInfromation(String title, String sub) {
    return Row(
      children: [
        Text(
          title,
          style: getTextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.grey500,
          ),
        ),
        Spacer(),
        Text(
          sub,
          style: getTextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.grey500,
          ),
        ),
      ],
    );
  }
}