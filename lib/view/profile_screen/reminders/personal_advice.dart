import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_animation/custom_animation.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalAdvice extends StatefulWidget {
  const PersonalAdvice({super.key});

  @override
  State<PersonalAdvice> createState() => _PersonalAdviceState();
}

class _PersonalAdviceState extends State<PersonalAdvice> {
  bool personalAdvice = true;
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
                  'Content',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18..sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15..h),
            GestureDetector(
              onTap: () {
                setState(() {
                  personalAdvice = !personalAdvice;
                });
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.transparent,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SubText(
                      text: 'Personal advice',
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 50,
                      height: 28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: personalAdvice ? AppColor.primaryColor : Theme.of(context).shadowColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Align(
                          alignment: personalAdvice
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
                  ],
                ),
              ),
            ),
            SizedBox(height: 20..h),
          ],
        ),
      ),
    );
  }
}
