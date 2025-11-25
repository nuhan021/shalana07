import 'package:shalana07/features/onboard_screen/presentation/view/obboarding.dart';
import 'package:shalana07/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'core/bindings/controller_binder.dart';
import 'core/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(375, 828),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoute.splashScreen,
          //  home: const OnboardingScreen(),
          getPages: AppRoute.routes,
          initialBinding: ControllerBinder(),
          themeMode: ThemeMode.light,
          theme: AppTheme.lightTheme,
          // darkTheme: AppTheme.darkTheme,

          // this section of code prevent system text size increasing problem
          builder: (context, widget) {
            double baseScale = 1.0; // default
            double width = MediaQuery.of(context).size.width;

            if (width < 360) {
              baseScale = 0.9; // smaller devices
            } else if (width > 500) {
              baseScale = 1.1; // tablets or large screens
            }

            return MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: TextScaler.linear(baseScale)),
              child: widget!,
            );
          },
        );
      },
    );
  }
}
