import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';

import 'package:shalana07/features/avatar/presentation/screens/avatar_screen.dart';
import 'package:shalana07/features/home/common_homescren.dart';
import '../../../../core/common/styles/global_text_style.dart';
import '../../../../core/utils/constants/colors.dart';


class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar({super.key});

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  PersistentTabController _controller = PersistentTabController();
  

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  // add screens here, do not touch anything!
  List<Widget> _buildScreens() {
    return [CommonHomeScreen(), Placeholder(), Placeholder(), AvatarScreen()];
  }

  List<PersistentTabConfig> _tabs() => [
    PersistentTabConfig(
      screen: _buildScreens()[0],
      item: ItemConfig(
        icon: Image.asset(
          width: 25.w,
          IconPath.navbarHomeICon,
          color: _currentIndex == 0 ? AppColors.primary : AppColors.grey900,
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
          color: _currentIndex == 1 ? AppColors.primary : AppColors.grey900,
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
      screen: _buildScreens()[2],
      item: ItemConfig(
        icon: Image.asset(
          width: 25.w,
          IconPath.navbarStoreICon,
          color: _currentIndex == 3 ? AppColors.primary : AppColors.grey900,
        ),
        title: "Store",
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
          IconPath.navbarProfileICon,
          color: _currentIndex == 4 ? AppColors.primary : AppColors.grey900,
        ).paddingOnly(bottom: 5),
        title: "Mission",
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
      controller: _controller,

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
