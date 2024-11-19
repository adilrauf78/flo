import 'package:flo/constants/assets_path.dart';
import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginBottom extends StatelessWidget {
  const LoginBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close_outlined,size: 24, color: Colors.black)),
                SubText(
                  text: 'Create account',
                  fontWeight: FontWeight.w600,
                ),
                Container(
                  width: 24,
                )
              ],
            ),
            SizedBox(height: 20..h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                textAlign: TextAlign.center,
                'Register to safe your data, or login to your access your account',
                style: TextStyle(
                  color: AppColor.black.withOpacity(.25),
                  fontSize: 14..sp,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
            SizedBox(height: 20..h),
            Container(
              width: double.infinity,
              height: 50..h,
              decoration: BoxDecoration(
                color: AppColor.black.withOpacity(.1),
                borderRadius: BorderRadius.circular(50..r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('${iconPath}google.svg',width: 24..w,height: 24..h,),
                  SizedBox(width: 10..w),
                  SubText(
                    text: 'Continue with Google',
                    fontWeight: FontWeight.w500,
                  ),
                ],
              )
            ),
            SizedBox(height: 10..h),
            Container(
                width: double.infinity,
                height: 50..h,
                decoration: BoxDecoration(
                  color: AppColor.black.withOpacity(.1),
                  borderRadius: BorderRadius.circular(50..r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('${iconPath}email.svg',width: 24..w,height: 24..h,),
                    SizedBox(width: 10..w),
                    SubText(
                      text: 'Continue with Email',
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(width: 10..w),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}

