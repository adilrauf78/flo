import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_animation/custom_animation.dart';
import 'package:flo/custom_widget/custom_button/custom_button.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class HealthConnect extends StatelessWidget {
  const HealthConnect({super.key});

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () => navigateBackWithAnimation(context),
                    child: Icon(Icons.arrow_back_outlined,size: 24, color: Theme.of(context).primaryColor,)),
                Icon(Iconsax.info_circle,size: 24, color: Theme.of(context).primaryColor,),
              ],
            ),
            SizedBox(height: 30..h,),
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
                  Row(
                    children: [
                      Icon(Icons.health_and_safety_outlined,color: AppColor.black.withOpacity(.5)),
                      SizedBox(width: 15..w),
                      SubText(
                        text: 'Health Connect',
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                  Container(
                    width: 100..w,
                    height: 30..h,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(50..r),
                    ),
                    child: Center(
                      child: Text14(
                        text: 'Set up',
                        color: AppColor.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 40..h),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 15),
              child: Text.rich(
                TextSpan(
                  text: 'Allowing Flo access to your health data means you\'re helping make cycle '
                      'prediction more accurate, as well as contributing to our research and product '
                      'improvement as defined by ',
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: '. For research activities, we only use your de-identified or aggregated data.',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
