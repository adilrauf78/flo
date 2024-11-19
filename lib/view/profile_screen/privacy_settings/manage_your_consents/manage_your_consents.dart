import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_animation/custom_animation.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class ManageYourConsents extends StatefulWidget {
  const ManageYourConsents({super.key});

  @override
  State<ManageYourConsents> createState() => _ManageYourConsentsState();
}

class _ManageYourConsentsState extends State<ManageYourConsents> {
  bool isMetricSystemEnabled = true;
  bool isMetricSystemEnabled1 = true;

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
                  'Manage your consents',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18..sp,
                  ),
                ),

              ],
            ),
            SizedBox(height: 20..h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20..h),
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
                            text: 'Allow tracking',
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
                    SizedBox(height: 10..h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "By allowing tracking, you agree that Flo can:\n"
                            "• Track you across other companies apps and websites\n"
                            "• Share your personal data with AppsFlyer (Flo's tracking partner) and its partners '"
                            "'to help spread the word about Flo. This data includes your technical identifiers, your age group, what Flo subscription you have, and when you open the Flo app",
                        style: TextStyle(
                            color: Theme.of(context).cardColor,
                            fontSize: 14..sp,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                    SizedBox(height: 30..h),
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
                          Expanded(
                            child: Text(
                              'Allow Flo to process my health data',
                              style: TextStyle(
                                color: AppColor.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16..sp,
                              ),
                            ),
                          ),
                          SizedBox(width: 10..w,),
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
                    SizedBox(height: 10..h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Flo relies on your health data for you to be able to use the app. If you turn this option off, we'll direct you to delete your account.",
                        style: TextStyle(
                            color: Theme.of(context).cardColor,
                            fontSize: 14..sp,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                    SizedBox(height: 20..h),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
