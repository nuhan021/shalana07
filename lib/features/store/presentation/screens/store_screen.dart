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
      appBar: CustomChildAppBar(
        title: 'Avatar Store',
        isBackButtonVisible: false,
        isCenterTitle: false,
      ),

      body: Column(
        children: [
          15.verticalSpace,

          // search bar
          SizedBox(
            height: 45.h,
            child: TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                labelText: 'Search Items',
                labelStyle: getTextStyle(
                  color: AppColors.grey300,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),

                suffixIcon: Image.asset(IconPath.search, scale: 3,),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey400),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey400),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey400),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey400),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey400),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey400),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                // Optional: Remove padding/spacing that might suggest a border
                contentPadding: EdgeInsets.symmetric(horizontal: 5.r),
                isDense: true,
              ),
            ),
          ).paddingSymmetric(horizontal: 16.r),

          15.verticalSpace,

          // tab bar for category
          TabBar(
            controller: _tabController,
            labelStyle: getTextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            unselectedLabelStyle: getTextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            indicatorColor: AppColors.primary,
            overlayColor: MaterialStateProperty.resolveWith<Color?>((
              Set<MaterialState> states,
            ) {
              if (states.contains(MaterialState.pressed)) {
                return AppColors.primary.withOpacity(0.1);
              }
              return null; // Fallback to default behavior for other states
            }),
            splashBorderRadius: BorderRadius.circular(10.r),
            tabs: [
              // Each tab is a Tab widget.
              Tab(text: 'All'),
              Tab(text: 'Avatar'),
              Tab(text: 'Dress'),
              Tab(text: 'Pets'),
            ],
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [AllItemsTab(), AvatarTab(), PetsTab(), DressTab()],
            ).paddingSymmetric(horizontal: 16.r),
          ),
        ],
      ),
    );
  }
}
