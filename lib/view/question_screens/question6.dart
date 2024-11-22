import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_animation/custom_animation.dart';
import 'package:flo/custom_widget/custom_button/custom_button.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flo/view/question_screens/question7.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Question6 extends StatefulWidget {
  const Question6({super.key});

  @override
  State<Question6> createState() => _Question6State();
}

class _Question6State extends State<Question6> {
  int currentIndex = 0;

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
                          child: Icon(Icons.arrow_back_outlined, size: 24,
                            color: Theme.of(context).primaryColor,)),
                      InkWell(
                        onTap: () => navigateToNextScreen(context, Question7()),
                        child: Text14(
                          text: 'Skip',
                          color: Theme.of(context).focusColor,
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 20
                            ..h),
                          Text24(
                            text: 'Do you try to conceive on your most fertile days?',
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(height: 40
                            ..h),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = 1;
                              });
                            },
                            child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: currentIndex == 1
                                    ? AppColor.primaryColor
                                    : AppColor.backgroundColor,
                                borderRadius: BorderRadius.circular(10
                                  ..r),
                              ),
                              child: SubText(
                                fontSize: 18,
                                text: 'Yes',
                                color: currentIndex == 1
                                    ? AppColor.white
                                    : AppColor.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 10
                            ..h),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = 2;
                              });
                            },
                            child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: currentIndex == 2
                                    ? AppColor.primaryColor
                                    : AppColor.backgroundColor,
                                borderRadius: BorderRadius.circular(10
                                  ..r),
                              ),
                              child: SubText(
                                fontSize: 18,
                                text: 'No',
                                color: currentIndex == 2
                                    ? AppColor.white
                                    : AppColor.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 10
                            ..h),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = 3;
                              });
                            },
                            child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: currentIndex == 3
                                    ? AppColor.primaryColor
                                    : AppColor.backgroundColor,
                                borderRadius: BorderRadius.circular(10
                                  ..r),
                              ),
                              child: SubText(
                                fontSize: 18,
                                text: 'I don\'t know ',
                                color: currentIndex == 3
                                    ? AppColor.white
                                    : AppColor.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Visibility(
                visible: currentIndex != 0,
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
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
                    onTap: () {
                      Future.delayed(Duration(seconds: 1), () {
                        navigateToNextScreen(context, Question7());
                      });
                    },
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
        )
    );
  }
}
