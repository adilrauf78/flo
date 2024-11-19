import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_animation/custom_animation.dart';
import 'package:flo/custom_widget/custom_button/custom_button.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flo/view/partner/link_partner/cancel_invite.dart';
import 'package:flo/view/partner/link_partner/send_pairing_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';


class LinkPartner extends StatelessWidget {
  const LinkPartner({super.key});

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
                  SizedBox(height: 55..h),
                  Center(
                    child: GradientText(
                      'Flo for Partners',
                      style: TextStyle(
                          fontSize: 32..sp,
                          fontWeight: FontWeight.w600
                      ),
                      colors: [
                        Colors.orangeAccent,
                        AppColor.primaryColor,
                        Colors.blueAccent,
                      ],
                    ),
                  ),
                  SizedBox(height: 25..h),
                  Center(
                    child: Text14(
                      fontSize: 18,
                      text: 'Share your pairing code',
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 15..h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      textAlign: TextAlign.center,
                      'Your partner will receive a link to download the Flo app. He\'ll then use the code to pair your profiles.',
                      style: TextStyle(
                          color: Theme.of(context).cardColor,
                          fontSize: 16..sp,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  SizedBox(height: 25..h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).shadowColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text24(
                      fontSize: 32,
                      color: Theme.of(context).primaryColor,
                      text: 'B6SYJE',
                    ),
                  ),
                  SizedBox(height: 30..h),
                  GestureDetector(
                    onTap: () => navigateToNextScreen(context, SendPairingCode()),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(50..r),
                        ),
                        child: Text(
                          'Send pairing code',
                          style: TextStyle(
                            color: Theme.of(context).hintColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18..sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15..h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      textAlign: TextAlign.center,
                      'You personal data is important. Only share it with a trusted,responsible partner.',
                      style: TextStyle(
                          color: Theme.of(context).cardColor,
                          fontSize: 14..sp,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),

                ],
              ),
              GestureDetector(
                onTap: () => navigateToNextScreen(context, CancelInvite()),
                child: Padding(
                  padding: const EdgeInsets.only(bottom:30),
                  child: Center(
                    child: Text18(
                      text: 'Cancel invite',
                      color: Theme.of(context).cardColor,
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
