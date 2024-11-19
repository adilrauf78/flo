import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_animation/custom_animation.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flo/view/profile_screen/app_settings/health_connect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({super.key});

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  bool isMetricSystemEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 45..h),
            Row(
              children: [
                InkWell(
                    onTap: () => navigateBackWithAnimation(context),
                    child: Icon(Icons.arrow_back_outlined,size: 24, color: Theme.of(context).primaryColor,)),
                SizedBox(width: 50,),
                Text(
                  'App settings',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18..sp,
                  ),
                ),

              ],
            ),
            SizedBox(height: 40..h),
            GestureDetector(
              onTap: () => navigateToNextScreen(context, HealthConnect()),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(10..r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.health_and_safety_outlined,color: AppColor.black.withOpacity(.5)),
                        SizedBox(width: 15..w),
                        SubText(
                          text: 'Health Connect',
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    Icon(Icons.keyboard_arrow_right,color: AppColor.black.withOpacity(.25),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 25..h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(10..r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubText(
                    text: 'Metric system',
                    fontWeight: FontWeight.w400,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isMetricSystemEnabled = !isMetricSystemEnabled;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 50,
                      height: 28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: isMetricSystemEnabled ? AppColor.primaryColor : AppColor.black.withOpacity(.1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Align(
                          alignment: isMetricSystemEnabled
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20..h),
          ],
        ),
      ),
    );
  }
}
