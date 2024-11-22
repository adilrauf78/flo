import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flo/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'view/bottom_navigator/bottom_navigator.dart';
import 'view/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (_ , child) {
      return AdaptiveTheme(
        light: ThemeData.light().copyWith(
          scaffoldBackgroundColor: AppColor.backgroundColor,
          hintColor: AppColor.white,
          primaryColor: AppColor.black,
          shadowColor: AppColor.black.withOpacity(.1),
          focusColor: AppColor.black.withOpacity(.25),
          cardColor: AppColor.black.withOpacity(.5),
          dividerColor: AppColor.black.withOpacity(.7),
        ),
        dark: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.black,
          hintColor: AppColors.black,
          primaryColor: AppColors.white,
          shadowColor: AppColors.white.withOpacity(.3),
          focusColor: AppColors.white.withOpacity(.5),
          cardColor: AppColors.white,
          dividerColor: AppColors.white.withOpacity(.7),
        ),
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          darkTheme: darkTheme,
          home: SplashScreen(),
        ),
      );
    },
    );
  }
}

