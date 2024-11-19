import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_animation/custom_animation.dart';
import 'package:flo/custom_widget/custom_button/custom_button.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bottom_navigator/bottom_navigator.dart';

class InviteCancelled extends StatelessWidget {
  const InviteCancelled({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20..h),
                  InkWell(
                      onTap: () => navigateBackWithAnimation(context),
                      child: Icon(Icons.close_outlined,size: 24, color: Theme.of(context).primaryColor,)),
                  SizedBox(height: 60..h),
                  Center(
                    child: Text24(
                      text: 'Invite cancelled',
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(height: 20..h),
                  Text(
                    textAlign: TextAlign.center,
                    'The Flo for Partners invite you sent has been cancelled. You can reactivate anytime-just share again to generate a new pairing code.' ,
                    style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontSize: 16..sp,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => navigateToNextScreen(context, NavigationScreen(currentTab: 4,)),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Center(
                    child: QuestionButton(
                      text: 'Got it',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
