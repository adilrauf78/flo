import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_animation/custom_animation.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flo/login_bottom/login_bottom.dart';
import 'package:flo/view/profile_screen/create_avatar.dart';
import 'package:flo/view/profile_screen/profile_screen.dart';
import 'package:flo/view/profile_screen/profile_setting/anonymous_mode/anonymous_mode.dart';
import 'package:flo/view/profile_screen/profile_setting/life_cycle_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({super.key});

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          child: LoginBottom(),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 45..h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_outlined,size: 24, color: Theme.of(context).primaryColor,)),
                SizedBox(width: 50,),
                Text(
                  'Profile settings',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18..sp,
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 15..h),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                  ),
                  child: Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        'Register to save your data, or log in to access your account',
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 18..sp,

                        ),
                      ),
                      SizedBox(height: 15..h),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _showBottomSheet(context);
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50..h,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                color: AppColor.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16..sp,
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 25..h),
                GestureDetector(
                  onTap: () => navigateToNextScreen(context, CreateAvatar()),
                  child: Container(
                    width: 100..w,
                    height: 100..h,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(Icons.pets, color: Colors.white, size: 40),
                    ),
                  ),
                ),
                SizedBox(height: 15..h),
                Text(
                  'Select Profile Picture',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16..sp,
                  ),
                ),
                SizedBox(height: 25..h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(10..r),
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => navigateToNextScreen(context, AnonymousMode()),
                          child: Container(
                            padding: EdgeInsets.only(right: 10,bottom: 15,top: 15),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border(
                                    bottom: BorderSide(
                                      color: AppColor.black.withOpacity(.25),
                                      width: .2,
                                    )
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SubText(
                                  text: 'Anonymous Mode',
                                  fontWeight: FontWeight.w400,
                                ),
                                Row(
                                  children: [
                                    SubText(
                                      text: 'Off',
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.black.withOpacity(.5),
                                    ),
                                    SizedBox(width: 5,),
                                    Icon(Icons.keyboard_arrow_right,color: AppColor.black.withOpacity(.25),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => navigateToNextScreen(context, LifeCycleSettings()),
                          child: Container(
                            padding: EdgeInsets.only(right: 10,bottom: 15,top: 15),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.transparent
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SubText(
                                  text: 'Lifecycle settings',
                                  fontWeight: FontWeight.w400,
                                ),
                                Icon(Icons.keyboard_arrow_right,color: AppColor.black.withOpacity(.25),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
