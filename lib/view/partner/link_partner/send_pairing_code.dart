import 'package:flo/constants/assets_path.dart';
import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_animation/custom_animation.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flo/view/partner/link_partner/cancel_invite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendPairingCode extends StatelessWidget {
  const SendPairingCode({super.key});

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
                  Container(
                    child: Center(child: Image.asset('${imagePath}wait.png',width:200..w,
                      height: 200..h,)),
                  ),
                  Center(
                    child: Text14(
                      fontSize: 18,
                      text: 'Waiting for him to pair',
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 15..h),
                  Row(
                    children: [
                      Icon(Icons.lock_open,size: 24,color: Colors.green,),
                      SizedBox(width: 15..w),
                      Expanded(
                        child: Text(
                          'You\'ve invited your partner',
                          style: TextStyle(
                              color: Theme.of(context).cardColor,
                              fontSize: 16..sp,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10..h),
                  Row(
                    children: [
                      Icon(Icons.lock_outline,size: 24,color: Theme.of(context).cardColor,),
                      SizedBox(width: 15..w),
                      Expanded(
                        child: Text(
                          'He\'ll use this code to pair your profiles',
                          style: TextStyle(
                              color: Theme.of(context).cardColor,
                              fontSize: 16..sp,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10..h),
                  Row(
                    children: [
                      Icon(Icons.lock_outline,size: 24,color: Theme.of(context).cardColor,),
                      SizedBox(width: 15..w),
                      Expanded(
                        child: Text(
                          'They you can both use Flo for Partners',
                          style: TextStyle(
                              color: Theme.of(context).cardColor,
                              fontSize: 16..sp,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ],
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
                      text: 'B6SYJE',
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(height: 10..h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Theme.of(context).shadowColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text14(
                          text: 'Lost the code? You can send it again anytime.',
                          color: Theme.of(context).primaryColor,
                          fontSize: 16..sp,
                        ),
                        SizedBox(height: 25..h),
                        Text18(
                          text: 'Resend the code',
                          color: AppColor.primaryColor,
                        ),
                      ],
                    ),
                  ),

                ],
              ),
              GestureDetector(
                onTap: () => navigateToNextScreen(context, CancelInvite()),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
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
