import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_animation/custom_animation.dart';
import 'package:flo/custom_widget/custom_button/custom_button.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flo/view/partner/link_partner/invite_cancelled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CancelInvite extends StatelessWidget {
  const CancelInvite({super.key});

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
                      child: Icon(Icons.close_outlined,size: 24,color: Theme.of(context).primaryColor,)),
                  SizedBox(height: 60..h),
                  Text24(
                    text: 'Are you sure you want to cancel invite?',
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(height: 20..h),
                  Text(
                    textAlign: TextAlign.center,
                        'Cancelling will mean your partner can still download Flo but they won\'t be able to pair with your profile.' ,
                    style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontSize: 16..sp,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => navigateToNextScreen(context, InviteCancelled()),
                      child: Center(
                        child: QuestionButton(
                          text: 'Yes,Cancel',
                        ),
                      ),
                    ),
                    SizedBox(height: 20..h),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Center(
                        child: Text18(
                          text: 'No,don\'t cancel',
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
