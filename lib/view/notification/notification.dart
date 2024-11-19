import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_animation/custom_animation.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flo/view/profile_screen/reminders/reminders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 45..h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () => navigateBackWithAnimation(context),
                        child: Icon(Icons.arrow_back_outlined,size: 24, color: Colors.black)),
                    SizedBox(width: 50,),
                    Text(
                      'Notifications',
                      style: TextStyle(
                        color: AppColor.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18..sp,
                      ),
                    ),
                  ],
                ),
                InkWell(
                    onTap: () => navigateToNextScreen(context, Reminders()),
                    child: Icon(Iconsax.setting_2,color: AppColor.black,)),
              ],
            ),
          ),
          SizedBox(height: 10..h),
          Divider(
            height: 1,
            color: AppColor.black.withOpacity(.25),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15..h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text14(
                      text: 'Earlier',
                    ),
                  ),
                  SizedBox(height: 5..h),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 3,
                    itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Container(
                            padding: EdgeInsets.all(20,),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: currentIndex == index ? AppColor.primaryColor.withOpacity(.2) : Colors.transparent,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.ac_unit_outlined,color: AppColor.primaryColor,),
                                SizedBox(width: 20..w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Introduction Secret Chats Rules',
                                        style: TextStyle(
                                          color: AppColor.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18..sp,
                                          overflow: TextOverflow.ellipsis
                                        ),
                                      ),
                                      Text(
                                        'Several guidelines to keep things safe and fun for everyone',
                                        maxLines: 4,
                                        style: TextStyle(
                                            color: AppColor.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18..sp,
                                            overflow: TextOverflow.ellipsis
                                        ),
                                      ),
                                      Text(
                                        'Take a look >',
                                        style: TextStyle(
                                            color: AppColor.primaryColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18..sp,
                                            overflow: TextOverflow.ellipsis
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
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
