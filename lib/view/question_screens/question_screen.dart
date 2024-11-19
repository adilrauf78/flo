import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_animation/custom_animation.dart';
import 'package:flo/custom_widget/custom_button/custom_button.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flo/view/bottom_navigator/bottom_navigator.dart';
import 'package:flo/view/question_screens/question_2/question_yes.dart';
import 'package:flo/view/question_screens/questions_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentIndex = 0;
  void _onNext() {
    if (currentIndex == 1) {
      navigateToNextScreen(context, QuestionYes());
    } else if (currentIndex == 2) {
      navigateToNextScreen(context, Questions3());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).hintColor,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(height: 55),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () => navigateBackWithAnimation(context),
                        child: Icon(Icons.arrow_back_outlined, size: 24,color:
                        Theme.of(context).primaryColor,)),
                    InkWell(
                      onTap: () => navigateToNextScreen(context,QuestionYes()),
                      child: Text14(
                        text: 'Skip',
                        color: Theme.of(context).focusColor,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30..h),
                Text24(
                  text: 'Are you using Flo for yourself?',
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(height: 50..h),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: currentIndex == 1 ?AppColor.primaryColor :  AppColor.backgroundColor,
                      borderRadius: BorderRadius.circular(10..r),
                    ),
                    child: SubText(
                      fontSize: 18,
                      text: 'Yes',
                      color: currentIndex == 1 ?AppColor.white :  AppColor.black,
                    ),
                  ),
                ),
                SizedBox(height: 10..h),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      currentIndex = 2;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: currentIndex == 2 ?AppColor.primaryColor :  AppColor.backgroundColor,
                      borderRadius: BorderRadius.circular(10..r),
                    ),
                    child: SubText(
                      fontSize: 18,
                      text: 'No,I have a partner code',
                      color: currentIndex == 2 ?AppColor.white :  AppColor.black,
                    ),
                  ),
                ),

              ],
            ),
          ),

          Positioned(
            bottom: 0,
            child: Visibility(
              visible: currentIndex != 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                        color: Theme.of(context).shadowColor,
                        width: 1,
                      )
                  ),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: GestureDetector(
                  onTap: currentIndex != 0 ? _onNext : null,
                  child: Center(
                    child: QuestionButton(
                      text: 'Next',
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
