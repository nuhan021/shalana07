import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/custom_appbar.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/image_path.dart';
import 'package:shalana07/features/home/parent/controller/parent_home_controller.dart';
import 'package:shalana07/features/home/parent/presentatrion/widgets/account_card.dart'
    show LinkAccountCard;
import 'package:shalana07/features/home/parent/presentatrion/widgets/activity_card.dart';

class ParentHomescreen extends StatelessWidget {
  ParentHomescreen({super.key});
  //all controller
  final ParentHomeController controller = Get.put(ParentHomeController());

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      // Refresh indicator to allow pull-to-refresh functionality
      color: AppColors.primary,
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
      },
      child: Scaffold(
        backgroundColor: AppColors.appBackground,
        // Custom AppBar
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0.h),
          child: CustomAppBar(title: 'Home', notificationIcon: true,backArrowIcon: false,),
        ),

        // Main content of the screen
        body: Padding(
          padding: EdgeInsets.only(left: 15.0.w, right: 15.0.w, top: 15.0.h),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //top image section,
                20.verticalSpace,
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0.r),
                  child: Image.asset(
                    ImagePath.login,
                    width: double.infinity,
                    height: 170.h,
                    fit: BoxFit.cover,
                  ),
                ),
                30.verticalSpace,

                //linked account section
                Text(
                  'Linked Accounts',
                  style: getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                24.verticalSpace,

                // Linked accounts list
                LinkAccountCard(name: "nuhan", relation: "mother",),

                24.verticalSpace,

                // Divider
                Divider(color: AppColors.grey300, thickness: 1.0),

                24.verticalSpace,

                //recent activities section
                Text(
                  'Recent Activities',
                  style: getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                24.verticalSpace,

                // Recent activities list
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
                      child: ActivityLIstCard(activity: activity),
                    );
                  },
                ),

                24.verticalSpace,

                // View More section
                InkWell(
                  onTap: () {
                    //when intrigate api work here, we can navigate to the activity list page
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColors.grey300,
                          thickness: 1.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                        child: Text(
                          'View More',
                          style: getTextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey600,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 24.0.w,
                        color: AppColors.grey600,
                      ),
                      Expanded(
                        child: Divider(
                          color: AppColors.grey300,
                          thickness: 1.0,
                          endIndent: 10.0.w,
                        ),
                      ),
                    ],
                  ),
                ),

                // Bottom space
                50.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
