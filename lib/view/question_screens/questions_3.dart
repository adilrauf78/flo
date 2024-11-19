import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_animation/custom_animation.dart';
import 'package:flo/custom_widget/custom_button/custom_button.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flo/login_bottom/login_bottom.dart';
import 'package:flo/view/question_screens/question4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Questions3 extends StatefulWidget {
  const Questions3({super.key});

  @override
  State<Questions3> createState() => _Questions3State();
}

class _Questions3State extends State<Questions3> {
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
                  SizedBox(height: 100),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 20..h),
                          Text24(
                            text: 'Welcome to Flo!\n Are you pregnant?',
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(height: 120..h),
                          GestureDetector(
                            onTap: () => navigateToNextScreen(context, Question4()),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(10..r),
                              ),
                              child: SubText(
                                fontSize: 18,
                                text: 'No, but I want to be',
                                color: AppColor.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 20..h,),
                          GestureDetector(
                            onTap: () => navigateToNextScreen(context, Question4()),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(10..r),
                              ),
                              child: SubText(
                                fontSize: 18,
                                text: 'No, I\m here to understand my body',
                                color: AppColor.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 20..h,),
                          GestureDetector(
                            onTap: () => navigateToNextScreen(context, Question4()),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(10..r),
                              ),
                              child: SubText(
                                fontSize: 18,
                                text: 'Yes, I am',
                                color: AppColor.white,
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
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    _showBottomSheet(context);
                  });
                },
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
                  child: Center(
                    child: Text18(text: 'Log in',color: AppColor.primaryColor,),
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}
