import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/custom_child_app_bar.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/features/store/presentation/widgets/all_items_tab.dart';
import 'package:shalana07/features/store/presentation/widgets/avatar_tab.dart';
import 'package:shalana07/features/store/presentation/widgets/dress_tab.dart';
import 'package:shalana07/features/store/presentation/widgets/pets_tab.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,

      // app bar
      appBar: CustomChildAppBar(title: 'Avatar Store'),

      body: Column(
        children: [
          15.verticalSpace,

          // search bar
          Container(
            height: 45.h,
            padding: EdgeInsets.all(10.r),
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColors.grey400),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search Items',
                  style: getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey300,
                  ),
                ),
                Image.asset(IconPath.search),
              ],
            ),
          ).paddingSymmetric(horizontal: 16.r),

          15.verticalSpace,

          // tab bar for category
          TabBar(
            controller: _tabController,
            labelStyle: getTextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            unselectedLabelStyle: getTextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            indicatorColor: AppColors.primary,
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return AppColors.primary.withOpacity(0.1);
                }
                return null; // Fallback to default behavior for other states
              },
            ),
            splashBorderRadius: BorderRadius.circular(10.r),
            tabs: [
              // Each tab is a Tab widget.
              Tab(text: 'All'),
              Tab(text: 'Avatar'),
              Tab(text: 'Pets'),
              Tab(text: 'Dress'),
            ],
          ),



          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                AllItemsTab(),
                AvatarTab(),
                PetsTab(),
                DressTab(),
              ],
            ).paddingSymmetric(horizontal: 16.r),
          ),
        ],
      ),
    );
  }
}
