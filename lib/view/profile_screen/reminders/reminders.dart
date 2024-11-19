import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_animation/custom_animation.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flo/view/profile_screen/reminders/drink_water.dart';
import 'package:flo/view/profile_screen/reminders/log_sleep.dart';
import 'package:flo/view/profile_screen/reminders/log_temperature.dart';
import 'package:flo/view/profile_screen/reminders/log_weight.dart';
import 'package:flo/view/profile_screen/reminders/ovulation.dart';
import 'package:flo/view/profile_screen/reminders/period_couple.dart';
import 'package:flo/view/profile_screen/reminders/period_end.dart';
import 'package:flo/view/profile_screen/reminders/period_start.dart';
import 'package:flo/view/profile_screen/reminders/personal_advice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Reminders extends StatefulWidget {
  const Reminders({super.key});

  @override
  State<Reminders> createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  bool isMetricSystemEnabled = true;
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
                    onTap: () => navigateBackWithAnimation(context),
                    child: Icon(Icons.arrow_back_outlined,size: 24, color: Theme.of(context).primaryColor,)),
                SizedBox(width: 50,),
                Text(
                  'Reminders',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18..sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20..h),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10..h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text14(
                      text: 'Secret Chats',
                      color: AppColor.secondaryColor,
                    ),
                  ),
                  SizedBox(height: 10..h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border(
                            bottom: BorderSide(
                              color: Theme.of(context).focusColor,
                              width: .2,
                            )
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SubText(
                                text: 'Secret Chats notifications',
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor,
                              ),
                              Text(
                                isMetricSystemEnabled ?'On':
                                'Enable this option to receive push notifications from Secret Chats. You will get '
                                    'only personal notifications on your activity',
                                style: TextStyle(
                                    color: Theme.of(context).cardColor,
                                    fontSize: 16..sp,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10..w),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isMetricSystemEnabled = !isMetricSystemEnabled;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 50,
                            height: 28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: isMetricSystemEnabled ? AppColor.primaryColor : Theme.of(context).shadowColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: Align(
                                alignment: isMetricSystemEnabled
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
                  SizedBox(height: 15..h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text14(
                      text: 'Content',
                      color: AppColor.secondaryColor,
                    ),
                  ),
                  SizedBox(height: 10..h),
                  InkWell(
                    onTap: () => navigateToNextScreen(context, PersonalAdvice()),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border(
                              bottom: BorderSide(
                                color: Theme.of(context).focusColor,
                                width: .2,
                              )
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SubText(
                            text: 'Personal advice',
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                          Text(
                            'On',
                            style: TextStyle(
                                color: Theme.of(context).cardColor,
                                fontSize: 16..sp,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15..h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text14(
                      text: 'Cycle',
                      color: AppColor.secondaryColor,
                    ),
                  ),
                  SizedBox(height: 10..h),
                  InkWell(
                    onTap: () => navigateToNextScreen(context, PeriodCouple()),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border(
                              bottom: BorderSide(
                                color: AppColor.black.withOpacity(.25),
                                width: .2,
                              )
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SubText(
                            text: 'Period in a couple of days',
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                          Text(
                            '10:00 AM',
                            style: TextStyle(
                                color: Theme.of(context).cardColor,
                                fontSize: 16..sp,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => navigateToNextScreen(context, Ovulation()),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border(
                              bottom: BorderSide(
                                color: Theme.of(context).focusColor,
                                width: .2,
                              )
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SubText(
                            text: 'Ovulation',
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor,
                          ),
                          Text(
                          '8:00 PM',
                            style: TextStyle(
                                color: Theme.of(context).cardColor,
                                fontSize: 16..sp,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => navigateToNextScreen(context, PeriodEnd()),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border(
                              bottom: BorderSide(
                                color: Theme.of(context).focusColor,
                                width: .2,
                              )
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SubText(
                            text: 'Period end',
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor,
                          ),
                          Text(
                          'Off',
                            style: TextStyle(
                                color: Theme.of(context).cardColor,
                                fontSize: 16..sp,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => navigateToNextScreen(context, PeriodStart()),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border(
                              bottom: BorderSide(
                                color: AppColor.black.withOpacity(.25),
                                width: .2,
                              )
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SubText(
                            text: 'Period start',
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor,
                          ),
                          Text(
                            '10:00 AM',
                            style: TextStyle(
                                color: Theme.of(context).cardColor,
                                fontSize: 16..sp,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15..h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text14(
                      text: 'Medication and contraception',
                      color: AppColor.secondaryColor,
                    ),
                  ),
                  SizedBox(height: 10..h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border(
                            bottom: BorderSide(
                              color: Theme.of(context).focusColor,
                              width: .2,
                            )
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SubText(
                          text: 'Contraception',
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text(
                          'Off',
                          style: TextStyle(
                              color: Theme.of(context).cardColor,
                              fontSize: 16..sp,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border(
                            bottom: BorderSide(
                              color: AppColor.black.withOpacity(.25),
                              width: .2,
                            )
                        )
                    ),
                    child: SubText(
                      text: 'ADD A PILL REMINDER',
                      fontWeight: FontWeight.w400,
                      color: AppColor.secondaryColor,
                    ),
                  ),
                  SizedBox(height: 15..h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text14(
                      text: 'Lifestyle',
                      color: AppColor.secondaryColor,
                    ),
                  ),
                  SizedBox(height: 10..h),
                  InkWell(
                    onTap: () => navigateToNextScreen(context, LogWeight()),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border(
                              bottom: BorderSide(
                                color: Theme.of(context).focusColor,
                                width: .2,
                              )
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SubText(
                            text: 'Log weight',
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor,
                          ),
                          Text(
                            'Off',
                            style: TextStyle(
                                color: Theme.of(context).cardColor,
                                fontSize: 16..sp,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => navigateToNextScreen(context, LogSleep()),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border(
                              bottom: BorderSide(
                                color: Theme.of(context).focusColor,
                                width: .2,
                              )
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SubText(
                            text: 'Log sleep',
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor,
                          ),
                          Text(
                            '9:00 AM',
                            style: TextStyle(
                                color: Theme.of(context).cardColor,
                                fontSize: 16..sp,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => navigateToNextScreen(context, DrinkWater()),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border(
                              bottom: BorderSide(
                                color: Theme.of(context).focusColor,
                                width: .2,
                              )
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SubText(
                            text: 'Drink water',
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor,
                          ),
                          Text(
                            '9:00 AM-6:00PM',
                            style: TextStyle(
                                color: Theme.of(context).cardColor,
                                fontSize: 16..sp,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => navigateToNextScreen(context, LogTemperature()),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border(
                              bottom: BorderSide(
                                color: Theme.of(context).focusColor,
                                width: .2,
                              )
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SubText(
                            text: 'Log temperature',
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor,
                          ),
                          Text(
                            '9:00 AM',
                            style: TextStyle(
                                color: Theme.of(context).cardColor,
                                fontSize: 16..sp,
                                fontWeight: FontWeight.w400
                            ),
                          ),
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
    );
  }
}
