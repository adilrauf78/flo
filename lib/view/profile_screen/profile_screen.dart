import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flo/constants/assets_path.dart';
import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_animation/custom_animation.dart';
import 'package:flo/custom_widget/custom_button/custom_button.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flo/login_bottom/login_bottom.dart';
import 'package:flo/view/profile_screen/app_lock.dart';
import 'package:flo/view/profile_screen/app_settings/app_settings.dart';
import 'package:flo/view/profile_screen/create_avatar.dart';
import 'package:flo/view/profile_screen/cycle_ovulation/cycle_ovulation.dart';
import 'package:flo/view/profile_screen/get_pregnant.dart';
import 'package:flo/view/profile_screen/pregnancy_mode.dart';
import 'package:flo/view/profile_screen/privacy_settings/privacy_settings.dart';
import 'package:flo/view/profile_screen/profile_setting/profile_setting.dart';
import 'package:flo/view/profile_screen/reminders/reminders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late bool darkMode ;
  List<Map<String, dynamic>> items =[
    {'text': 'Track cycle'},
    {'text': 'Get pregnant'},
    {'text': 'Track pregnancy'},
  ];
  int currentIndex = 0;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Safely access AdaptiveTheme here
    darkMode = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
  }

  void toggleDarkMode() {
    setState(() {
      darkMode = !darkMode;
      if (darkMode) {
        AdaptiveTheme.of(context).setDark();
      } else {
        AdaptiveTheme.of(context).setLight();
      }
    });
  }

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
  void _showCustomPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
                color: AppColor.backgroundColor,
                borderRadius: BorderRadius.circular(20)
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text18(
                  text: 'You\'re going to switch to Get Pregnant mode',
                  fontSize: 16.sp,
                ),
                SizedBox(height: 10..h),
                Text(
                  'Health Insights,Health Assistant, and Secret Chats will be customized to help you leverage fertile days.',
                  style: TextStyle(
                      color: AppColor.black.withOpacity(.5),
                      fontSize: 14..sp,
                      fontWeight: FontWeight.w400
                  ),
                ),
                SizedBox(height: 20..h),
                Text(
                  'Do you want to continue?',
                  style: TextStyle(
                      color: AppColor.black.withOpacity(.5),
                      fontSize: 14..sp,
                      fontWeight: FontWeight.w400
                  ),
                ),
                SizedBox(height: 25..h),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Text14(
                          text: 'No',
                          fontSize: 16..sp,
                          color: AppColor.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 20..w),
                      Text14(
                        text: 'Yes',
                        color: AppColor.black,
                        fontSize: 16..sp,
                        fontWeight: FontWeight.w400,
                      ),

                    ],
                  ),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 45..h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: InkWell(
                onTap: () => navigateBackWithAnimation(context),
                child: Icon(Icons.close_outlined,size: 24, color: Theme.of(context).primaryColor,)),
          ),
          SizedBox(height: 15..h),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 20..w,
                              height:20..h,
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  '!',
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 15..w),
                            Expanded(
                              child: Text(
                                'Register to save your data, or log in to access your account',
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 14..sp,
              
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 15..h),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _showBottomSheet(context);
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width*.3,
                            height: 35..h,
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
                                  fontSize: 14..sp,
                                ),
                              ),
                            ),
                          ),
                        ),
              
                      ],
                    ),
                  ),
                  SizedBox(height: 15..h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: GestureDetector(
                      onTap: () => navigateToNextScreen(context, ProfileSetting()),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomLeft,
                            colors: [
                              Theme.of(context).cardColor,
                              Theme.of(context).dividerColor,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10..r),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 35..h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () => navigateToNextScreen(context, CreateAvatar()),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 55..w,
                                        height: 55..h,
                                        decoration: BoxDecoration(
                                          color: Colors.blueAccent,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Icon(Icons.pets, color: Colors.white, size: 35),
                                        ),
                                      ),
                                      Positioned(
                                        top: 2,
                                        right: 2,
                                        child: Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            color: AppColor.white,
                                            border: Border.all(
                                                color: AppColor.black.withOpacity(.5),
                                                width: 2
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                              child: Icon(Icons.edit_outlined,color: AppColor.black,size: 15,)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 15..w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'No account',
                                      style: TextStyle(
                                        color:Theme.of(context).hintColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      'Edit info',
                                      style: TextStyle(
                                        color: AppColor.black.withOpacity(.7),
                                        fontSize: 16,
                                      ),
                                    ),

                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 45..h),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                decoration: BoxDecoration(
                                  color: AppColor.primaryColor,
                                  borderRadius: BorderRadius.circular(10..r),
                                ),
                                child: SubText(
                                  text: 'Flo Premium',
                                  color: AppColor.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15..h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text24(
                        text: 'My Goal:'
                    ),
                  ),
                  SizedBox(height: 10..h),
                  SizedBox(
                    height: 60..h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      padding: EdgeInsets.all(10),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                currentIndex = index;
                              });
                              switch(index){
                                case 0:
                                  setState(() {
                                    _showCustomPopup(context);
                                  });
                                case 1:
                                  navigateToNextScreen(context, GetPregnant());
                                case 2:
                                  navigateToNextScreen(context, PregnancyMode());
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15,),
                              decoration: BoxDecoration(
                                color: currentIndex ==index? AppColor.primaryColor : Theme.of(context).shadowColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: SubText(
                                  text: items[index]['text'],
                                  color: currentIndex ==index? AppColor.white : AppColor.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20..h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(10..r),
                      ),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () => navigateToNextScreen(context, AppLock()),
                            child: Container(
                              padding: EdgeInsets.only(left: 15,),
                              child: Row(
                                children: [
                                  Icon(Icons.lock_outline,color: AppColor.black,),
                                  SizedBox(width: 15..w),
                                  Expanded(
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
                                            text: 'App Lock',
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
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15,),
                            child: Row(
                              children: [
                                Icon(Iconsax.diagram,color: AppColor.black,),
                                SizedBox(width: 15..w),
                                Expanded(
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
                                          text: 'Graph & reports',
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
                          InkWell(
                            onTap: () => navigateToNextScreen(context, CycleOvulation()),
                            child: Container(
                              padding: EdgeInsets.only(left: 15,),
                              child: Row(
                                children: [
                                  Icon(Icons.sync,color: AppColor.black,),
                                  SizedBox(width: 15..w),
                                  Expanded(
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
                                            text: 'Cycle and ovulation ',
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
                          ),
                          InkWell(
                            onTap: () => navigateToNextScreen(context, AppSettings()),
                            child: Container(
                              padding: EdgeInsets.only(left: 15,),
                              child: Row(
                                children: [
                                  Icon(Iconsax.setting_2,color: AppColor.black,),
                                  SizedBox(width: 15..w),
                                  Expanded(
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
                                            text: 'App settings',
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
                          ),
                          InkWell(
                            onTap: () => navigateToNextScreen(context, PrivacySettings()),
                            child: Container(
                              padding: EdgeInsets.only(left: 15,),
                              child: Row(
                                children: [
                                  Icon(Iconsax.user_octagon,color: AppColor.black,),
                                  SizedBox(width: 15..w),
                                  Expanded(
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
                                            text: 'Privacy Settings',
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
                          ),
                          InkWell(
                            onTap: () => navigateToNextScreen(context, Reminders()),
                            child: Container(
                              padding: EdgeInsets.only(left: 15,),
                              child: Row(
                                children: [
                                  Icon(Iconsax.notification,color: AppColor.black,),
                                  SizedBox(width: 15..w),
                                  Expanded(
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
                                            text: 'Reminders',
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
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15,),
                            child: Row(
                              children: [
                                Icon(Iconsax.message_question,color: AppColor.black,),
                                SizedBox(width: 15..w),
                                Expanded(
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
                                          text: 'Help',
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
                          Container(
                            padding: EdgeInsets.only(left: 15,),
                            child: Row(
                              children: [
                                Icon(Iconsax.moon,color: AppColor.black,),
                                SizedBox(width: 15..w),
                                Expanded(
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
                                          text: 'Dark Mode',
                                          fontWeight: FontWeight.w400,
                                        ),
                                        GestureDetector(
                                          onTap: toggleDarkMode,
                                          child: AnimatedContainer(
                                            duration: const Duration(milliseconds: 300),
                                            width: 50,
                                            height: 28,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: darkMode
                                                  ? AppColor.primaryColor
                                                  :  Colors.grey,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 4),
                                              child: Align(
                                                alignment: darkMode
                                                    ? Alignment.centerRight
                                                    : Alignment.centerLeft,
                                                child: Container(
                                                  width: 20,
                                                  height: 20,
                                                  decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15..h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical:20),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(10..r),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 130.w,
                              height: 130.h,
                              child: Image.asset('${imagePath}protect.png')),
                          SubText(
                            text: 'Your data is protected',
                            color: AppColor.black,
                            fontSize: 20..sp,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(height: 5..h),
                          Text(
                            textAlign: TextAlign.center,
                            'Your privacy is our top priority.We\'ll never sell your data and you can delete it at anytime',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: AppColor.black.withOpacity(.4),
                              fontSize: 14..sp,
                            ),
                          ),
                          SizedBox(height: 10..h,),
                          Container(
                            width: MediaQuery.of(context).size.width*.3,
                            height: 35..h,
                            decoration: BoxDecoration(
                              color: AppColor.black.withOpacity(.1),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Text(
                                'Learn more',
                                style: TextStyle(
                                  color: AppColor.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14..sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20..h),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
