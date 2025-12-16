import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:shalana07/core/services/storage_service.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/features/auth/controller/loginController.dart';
import 'package:shalana07/features/avatar/common_avater_screen.dart';

import 'package:shalana07/features/avatar/presentation/screens/avatar_screen.dart';
import 'package:shalana07/features/bottom_nav_bar/controller/navaber_controller.dart';
import 'package:shalana07/features/create_goal/common_create_goal.dart';
import 'package:shalana07/features/daily_goal/common_daily_goal.dart';
import 'package:shalana07/features/home/common_homescren.dart';
import 'package:shalana07/features/profile/parent/presentation/view/parent_profile_screen.dart'; // Re-adding this import
import 'package:shalana07/features/store/presentation/screens/store_screen.dart';
import '../../../../core/common/styles/global_text_style.dart';
import '../../../../core/utils/constants/colors.dart';

class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar({super.key});

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  final NavaberController navaberController = Get.put(NavaberController());
  final Logincontroller logincontroller = Get.find<Logincontroller>();

  int _currentIndex = 0;
  String _userRole = '';

  @override
  void initState() {
    super.initState();
    _loadUserRole();
  }

  Future<void> _loadUserRole() async {
    final role = await StorageService.role();
    setState(() {
      _userRole = role;
    });
  }

  List<Widget> _buildScreens() {
    if (_userRole == 'PARENT') {
      return [
        CommonHomeScreen(),
        CommonDailyGoal(),
        CommonCreateGoal(),
        StoreScreen(),
        ParentProfile(),
      ];
    } else {
      return [
        CommonHomeScreen(),
        CommonDailyGoal(),
        CommonCreateGoal(),
        StoreScreen(),
        CommonAvatarScreen(),
      ];
    }
  }

  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: _buildScreens()[0],
          item: ItemConfig(
            icon: Image.asset(
              width: 25.w,
              IconPath.navbarHomeICon,
              color:
                  _currentIndex == 0 ? AppColors.primary : AppColors.grey900,
            ),
            title: "Home",
            textStyle: getTextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            activeForegroundColor: AppColors.primary,
            inactiveForegroundColor: Colors.black,
            activeColorSecondary: AppColors.grey900,
          ),
        ),
        PersistentTabConfig(
          screen: _buildScreens()[1],
          item: ItemConfig(
            icon: Image.asset(
              width: 25.w,
              IconPath.navbarGoalICon,
              color:
                  _currentIndex == 1 ? AppColors.primary : AppColors.grey900,
            ),
            title: "Goals",
            textStyle: getTextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            activeForegroundColor: AppColors.primary,
            inactiveForegroundColor: Colors.black,
            activeColorSecondary: AppColors.primary,
          ),
        ),
        PersistentTabConfig(
          screen: _buildScreens()[2],
          item: ItemConfig(
            icon: Icon(Icons.add, color: AppColors.grey900),
            title: "Add",
            textStyle: getTextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            activeForegroundColor: AppColors.primary,
            inactiveForegroundColor: Colors.black,
            activeColorSecondary: AppColors.primary,
          ),
        ),
        PersistentTabConfig(
          screen: _buildScreens()[3],
          item: ItemConfig(
            icon: Image.asset(
              width: 25.w,
              IconPath.navbarStoreICon,
              color:
                  _currentIndex == 3 ? AppColors.primary : AppColors.grey900,
            ),
            title: "Store",
            textStyle: getTextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            activeForegroundColor: AppColors.primary,
            inactiveForegroundColor: Colors.black,
            activeColorSecondary: AppColors.primary,
          ),
        ),
        PersistentTabConfig(
          screen: _buildScreens()[4],
          item: ItemConfig(
            icon: Image.asset(
              width: 25.w,
              IconPath.navbarProfileICon,
              color:
                  _currentIndex == 4 ? AppColors.primary : AppColors.grey900,
            ).paddingOnly(bottom: 5),
            title: _userRole == "PARENT" ? "Profile" : "Avatar",
            textStyle: getTextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            activeForegroundColor: AppColors.primary,
            inactiveForegroundColor: Colors.black,
            activeColorSecondary: AppColors.primary,
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: navaberController.controller,
      tabs: _tabs(),
      navBarBuilder: (navBarConfig) =>
          Style15BottomNavBar(navBarConfig: navBarConfig, height: 60.h),
      onTabChanged: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}

