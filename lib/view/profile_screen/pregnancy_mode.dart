import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_animation/custom_animation.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PregnancyMode extends StatefulWidget {
  const PregnancyMode({super.key});

  @override
  State<PregnancyMode> createState() => _PregnancyModeState();
}

class _PregnancyModeState extends State<PregnancyMode> {
  void _showCustomPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            decoration: BoxDecoration(
                color: AppColor.backgroundColor,
                borderRadius: BorderRadius.circular(15)
            ),
            padding: EdgeInsets.only(left: 15,right: 15,bottom: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20..h,),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(
                    'If you activate the pregnancy mode, a countdown to the birth of your baby will be shown instead of cycle predictions.',
                    style: TextStyle(
                        color: AppColor.black.withOpacity(.5),
                        fontSize: 16..sp,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
                SizedBox(height: 20..h,),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(
                    'Activate pregnancy mode?',
                    style: TextStyle(
                        color: AppColor.black.withOpacity(.5),
                        fontSize: 16..sp,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
                SizedBox(height: 25..h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Text14(
                        text: 'Cancel',
                        color: AppColor.secondaryColor,
                      ),
                    ),
                    SizedBox(width: 20..w),
                    Text14(
                      text: 'Activate',
                      color: AppColor.secondaryColor,
                    ),

                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 45..h),
            Row(
              children: [
                InkWell(
                    onTap: () => navigateBackWithAnimation(context),
                    child: Icon(Icons.arrow_back_outlined,size: 24, color: Theme.of(context).primaryColor)),
                SizedBox(width: 50,),
                Text(
                  'Pregnancy Mode',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18..sp,
                  ),
                ),

              ],
            ),
            SizedBox(height: 35..h),
            Text14(
              fontSize: 16..sp,
              text: 'Why log pregnancy in Flo?',
                color: Theme.of(context).primaryColor
            ),
            SizedBox(height: 40..h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.add_box_outlined,size: 24, color: Theme.of(context).dividerColor),
                SizedBox(width: 20..w),
                Expanded(
                  child: Text(
                    'See countdown to the birth of your baby',
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.notifications_on_outlined,size: 24, color: Theme.of(context).dividerColor,),
                SizedBox(width: 20..w),
                Expanded(
                  child: Text(
                    'Get daily health insights and information on your baby\'s development!',
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.auto_graph_outlined,size: 24, color: Theme.of(context).dividerColor,),
                SizedBox(width: 20..w),
                Expanded(
                  child: Text(
                    'Track weight,nutrition,and other lifestyle parameters',
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
            InkWell(
              onTap: (){
                _showCustomPopup(context);
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).focusColor,
                    ),
                  ]
                ),
                child: Center(
                  child: Text14(
                    text: 'LOG PREGNANCY',
                    fontWeight: FontWeight.w500,
                    color: AppColor.secondaryColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
