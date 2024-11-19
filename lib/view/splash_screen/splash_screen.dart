import 'dart:async';

import 'package:flo/constants/colors.dart';
import 'package:flo/view/bottom_navigator/bottom_navigator.dart';
import 'package:flo/view/question_screens/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QuestionScreen()));
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Text(
          'Flo',
          style: GoogleFonts.kaushanScript(
            color: AppColor.white,
            fontSize: 35,
          ),
        ),
      ),
    );
  }
}
