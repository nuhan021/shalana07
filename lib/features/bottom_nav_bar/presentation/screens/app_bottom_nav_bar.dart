import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
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
    return [
      Placeholder(),
      Placeholder(),
      Placeholder(),
      Placeholder(),
    ];
  }

  List<PersistentTabConfig> _tabs() => [
    PersistentTabConfig(

      screen: _buildScreens()[0],
      item: ItemConfig(
        icon: Image.asset(
          width: 35,
          IconPath.navbarHomeICon,
        ),
        title: "Home",
        activeForegroundColor: AppColors.primary,
        activeColorSecondary: AppColors.primary,
      ),
    ),

    PersistentTabConfig(
      screen: _buildScreens()[1],
      item: ItemConfig(
        icon: Image.asset(
          width: 35,
          IconPath.navbarGoalICon,
        ),
        title: "Quran",
        activeForegroundColor: AppColors.primary,
        activeColorSecondary: AppColors.primary,
      ),
    ),

    PersistentTabConfig(
      screen: _buildScreens()[2],
      item: ItemConfig(
        icon: Image.asset(
          width: 35, IconPath.navbarStoreICon ,
        ),
        title: "Hafalan",
        activeForegroundColor: AppColors.primary,
        activeColorSecondary: AppColors.primary,
      ),
    ),

    PersistentTabConfig(
      screen: _buildScreens()[3],
      item: ItemConfig(
        icon: Image.asset(
          width: 35,
          IconPath.navbarProfileICon ,
        ).paddingOnly(bottom: 5),
        title: "Mission",
        activeForegroundColor: AppColors.primary,
        activeColorSecondary: AppColors.primary,

      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      tabs: _tabs(),
      navBarBuilder: (navBarConfig) => Style4BottomNavBar(
        navBarConfig: navBarConfig,
      ),
      onTabChanged: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}