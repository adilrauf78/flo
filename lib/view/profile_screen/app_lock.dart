import 'package:flo/constants/assets_path.dart';
import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_animation/custom_animation.dart';
import 'package:flo/custom_widget/custom_button/custom_button.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLock extends StatelessWidget {
  const AppLock({super.key});

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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () => navigateBackWithAnimation(context),
                        child: Icon(Icons.arrow_back_outlined,size: 24, color: Theme.of(context).primaryColor)),
                  ],
                ),
                SizedBox(height: 15..h),
                Center(
                  child: Container(
                    child: Image.asset('${imagePath}applock.png'),
                  ),
                ),
                SizedBox(height: 5..h),
                Text24(
                    text: 'Protect your Flo account:',
                    color: Theme.of(context).primaryColor,
                ),
                SizedBox(height: 15..h),
                Text(
                  textAlign: TextAlign.center,
                  'Add a passcode and activate biometrics so only you can unlock your Flo account.',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16..sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: CircleButton(
                text: 'Get Started',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
