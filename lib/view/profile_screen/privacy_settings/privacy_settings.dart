import 'package:flo/constants/assets_path.dart';
import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_animation/custom_animation.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flo/view/profile_screen/privacy_settings/manage_your_consents/manage_your_consents.dart';
import 'package:flo/view/profile_screen/profile_setting/anonymous_mode/anonymous_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class PrivacySettings extends StatefulWidget {
  const PrivacySettings({super.key});

  @override
  State<PrivacySettings> createState() => _PrivacySettingsState();
}

class _PrivacySettingsState extends State<PrivacySettings> {
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
                  text: 'Delete account?',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 10..h),
                Text(
                  "This will delete your account and all data associated with it. You will be logged out of Flo. Your deletion will be processed in accordance with our Privacy Policy. This action can’t be undone.\n\n"
                      "You can also use Flo in Anonymous Mode as an alternative to deleting your account.",
                  style: TextStyle(
                      color: AppColor.black.withOpacity(.5),
                      fontSize: 14..sp,
                      fontWeight: FontWeight.w400
                  ),
                ),
                SizedBox(height: 15..h),
                InkWell(
                  onTap: () => navigateToNextScreen(context, AnonymousMode()),
                  child: Center(
                    child: SubText(
                      text: 'Use Anonymous Mode',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 20..h),
                Center(
                  child: SubText(
                    text: 'Delete my account',
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 20..h),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Text18(
                      text: 'Cancel',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 45..h),
            Row(
              children: [
                InkWell(
                    onTap: () => navigateBackWithAnimation(context),
                    child: Icon(Icons.arrow_back_outlined,size: 24, color: Theme.of(context).primaryColor,)),
                SizedBox(width: 50,),
                Text(
                  'Privacy settings',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18..sp,
                  ),
                ),

              ],
            ),
            SizedBox(height: 20..h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20..h),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(10..r),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 15,),
                            child: Row(
                              children: [
                                Icon(Iconsax.shield_tick ,color: AppColor.black,size: 28),
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
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SubText(
                                                text: 'Flo privacy explained',
                                                fontWeight: FontWeight.w500,
                                              ),
                                              SizedBox(height: 5..h),
                                              Text(
                                                'Find out how Flo keeps your data safe',
                                                style: TextStyle(
                                                    color: AppColor.black.withOpacity(.5),
                                                    fontSize: 14..sp,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 20..w),
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
                                Icon(Iconsax.info_circle ,color: AppColor.black,size: 28),
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
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SubText(
                                                text: 'Request information',
                                                fontWeight: FontWeight.w500,
                                              ),
                                              SizedBox(height: 5..h),
                                              Text(
                                                'Find out what cycle and health-related data we hold about you.',
                                                style: TextStyle(
                                                    color: AppColor.black.withOpacity(.5),
                                                    fontSize: 14..sp,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 20..w),
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
                                Icon(Iconsax.user,color: AppColor.black,size: 28),
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
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SubText(
                                                text: 'Change account details',
                                                fontWeight: FontWeight.w500,
                                              ),
                                              SizedBox(height: 5..h),
                                              Text(
                                                'Ask us to update your personal details, such as your name or email address.',
                                                style: TextStyle(
                                                  color: AppColor.black.withOpacity(.5),
                                                  fontSize: 14..sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 20..w),
                                        Icon(Icons.keyboard_arrow_right,color: AppColor.black.withOpacity(.25),)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () => navigateToNextScreen(context, ManageYourConsents()),
                            child: Container(
                              padding: EdgeInsets.only(left: 15,),
                              child: Row(
                                children: [
                                  Icon(Iconsax.card_tick ,color: AppColor.black,size: 28),
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
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SubText(
                                                  text: 'Manage your consents',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                SizedBox(height: 5..h),
                                                Text(
                                                  'Choose and control your privacy option.',
                                                  style: TextStyle(
                                                      color: AppColor.black.withOpacity(.5),
                                                      fontSize: 14..sp,
                                                      fontWeight: FontWeight.w400
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 20..w),
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
                            onTap: () {
                              setState(() {
                                _showCustomPopup(context);
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 15,),
                              child: Row(
                                children: [
                                  Icon(Iconsax.trash ,color: AppColor.black,size: 28),
                                  SizedBox(width: 15..w),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 10,bottom: 15,top: 15),
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border(
                                              bottom: BorderSide(
                                                color: Colors.transparent,
                                              )
                                          )
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SubText(
                                                  text: 'Delete my account',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                SizedBox(height: 5..h),
                                                Text(
                                                  'Permanently delete your account and any data associated with it, including cycle and health-related data.',
                                                  style: TextStyle(
                                                      color: AppColor.black.withOpacity(.5),
                                                      fontSize: 14..sp,
                                                      fontWeight: FontWeight.w400
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 20..w),
                                          Icon(Icons.keyboard_arrow_right,color: AppColor.black.withOpacity(.25),)
                                        ],
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
                    SizedBox(height: 20..h),
                    Container(
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
                    SizedBox(height: 20..h),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(10..r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SubText(
                            text: 'User ID',
                            fontWeight: FontWeight.w500,
                          ),
                          Text(
                            'Tap to copy',
                            style: TextStyle(
                                color: AppColor.black.withOpacity(.5),
                                fontSize: 14..sp,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          SizedBox(height: 5..h),
                          Text(
                            'ca8wuf-afsjfo8-sdklfj',
                            style: TextStyle(
                                color: AppColor.black.withOpacity(.5),
                                fontSize: 16..sp,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20..h),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
