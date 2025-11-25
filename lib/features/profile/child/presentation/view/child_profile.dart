import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/common_button.dart';
import 'package:shalana07/core/common/widgets/custom_child_app_bar.dart';
import 'package:shalana07/core/services/storage_service.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/core/utils/helpers/app_helper.dart';
import 'package:shalana07/features/auth/presentation/views/login_screen.dart';
import 'package:shalana07/features/profile/child/controller/child_profile_controller.dart';
import 'package:shalana07/features/profile/child/presentation/view/child_edit_profile.dart';
import 'package:shalana07/features/profile/child/presentation/widget/profilepicture.dart';
import 'package:shalana07/features/profile/child/presentation/widget/weekily_overview.dart';
import 'package:shalana07/features/profile/parent/presentation/widgets/custom_switch.dart';

class ChildProfile extends StatelessWidget {
  ChildProfile({super.key});
  final ChildProfileController controller = Get.put(ChildProfileController());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      key: _scaffoldKey,
      endDrawer: Drawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomChildAppBar(title: 'Profile', isAvatarVisible: false),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //////=======profile section =========////////////
              Profilepicture(controller: controller),

              10.verticalSpace,

              ///////name
              Center(
                child: Text(
                  "Calista Kimimela",
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
                  AppHelperFunctions.navigateToScreen(
                    context,
                    ChildEditProfile(),
                  );
                },
              ),

              20.verticalSpace,
              //////////body details
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

                  // Open end drawer on tap
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
              //////////======weekly Overview section =========////////////
              ///
              ///
              Row(
                children: [
                  Expanded(
                    child: WeeeklyOVerview(title: 'Completed Task', sub: '15'),
                  ),

                  10.horizontalSpace,
                  Expanded(
                    child: WeeeklyOVerview(title: 'Attive Task', sub: '12'),
                  ),

                  10.horizontalSpace,
                  Expanded(
                    child: WeeeklyOVerview(title: 'Earn coint', sub: '1000'),
                  ),
                ],
              ),

              //////////BAsic Information
              30.verticalSpace,
              Text(
                'Basic Information',
                style: getTextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),

              //////////////==profdile details=========/////////////
              20.verticalSpace,
              _buildInfromation('Date of Birth', '23 January, 2012'),
              20.verticalSpace,
              _buildInfromation("Age", '10 years'),
              20.verticalSpace,
              _buildInfromation('Email', 'm2P4o@example.com'),
              20.verticalSpace,
              //notificvation
              Row(
                children: [
                  Text(
                    "push notification",
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
                        controller.toggle.value = !controller.toggle.value;
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
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ],
                  );
                },
                child: GestureDetector(

                  child: Text(
                    'Log Out',
                    style: getTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.danger,
                    ),
                  ),
                ),
              ),
              50.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Row _buildInfromation(title, sub) {
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
