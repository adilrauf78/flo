import 'package:flo/constants/assets_path.dart';
import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_animation/custom_animation.dart';
import 'package:flo/custom_widget/custom_button/custom_button.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class AnonymousMode extends StatefulWidget {
  const AnonymousMode({super.key});

  @override
  State<AnonymousMode> createState() => _AnonymousModeState();
}

class _AnonymousModeState extends State<AnonymousMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 45..h),
                Row(
                  children: [
                    InkWell(
                        onTap: () => navigateBackWithAnimation(context),
                        child: Icon(Icons.arrow_back_outlined,size: 24, color: Theme.of(context).primaryColor)),
                    SizedBox(width: 50,),
                    Text(
                      'Anonymous Mode',
                      style: TextStyle(
                      color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18..sp,
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 25..h),
                Container(
                  width: 250..w,
                  height: 250..h,
                  child: Image.asset('${imagePath}anonymous.png'),
                ),
                SizedBox(height: 10..h),
                Text24(
                  text: 'Use Anonymous Mode',
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(height: 25..h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Theme.of(context).hintColor,
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(15..r),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Iconsax.card_tick ,color: Theme.of(context).primaryColor,size: 24),
                      SizedBox(width: 15..w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                             'We won\'t store your email, name or technical identifiers',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16..sp,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                            Text(
                              'We\'ll transfer only essential data, like cycles and symptoms,to your new Anonymous Mode account.',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14..sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 15..w),
                      Icon(Iconsax.info_circle ,color: AppColor.primaryColor,size: 24),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CircleButton(
                text: 'Use Anonymous Mode',
              ),
            )
          ],
        ),
      ),
    );
  }
}
