import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_animation/custom_animation.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CycleOvulation extends StatefulWidget {
  const CycleOvulation({super.key});

  @override
  State<CycleOvulation> createState() => _CycleOvulationState();
}

class _CycleOvulationState extends State<CycleOvulation> {
  bool chance = false;
  bool displayCycle = false;
  String selectedCycleLength = '21';
  final List<String> cyclelength = [
    for (int i = 21; i <= 50; i += 1) i.toString(),
  ];
  String selectedValuePeriod = '1';
  final List<String> periodlength = [
    for (int i = 1; i <= 12; i += 1) i.toString(),
  ];
  String selectedValuePhase = '8';
  final List<String> phase = [
    for (int i = 8; i <= 17; i += 1) i.toString(),
  ];
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
                    child: Icon(Icons.arrow_back_outlined,size: 24, color: Theme.of(context).primaryColor)),
                SizedBox(width: 50,),
                Text(
                  'Cycle and ovulation',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18..sp,
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 10..h),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 15..h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SubText(
                              text: 'Cycle length',
                              fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*.25,
                              child: DropdownButton<String>(
                                  value: selectedCycleLength,
                                  isExpanded: true,
                                  iconSize: 0,
                                  elevation: 0,
                                  style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  underline: Container(
                                    height: 1,
                                      color: Theme.of(context).focusColor,
                                  ),
                                  dropdownColor: Theme.of(context).hintColor,
                                  menuWidth: 90,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedCycleLength = newValue!;
                                    });
                                  },
                                  items: cyclelength.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Row(
                                        children: [
                                          Text(value),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                  selectedItemBuilder: (BuildContext context) {
                                    return cyclelength.map((String value) {
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('$value days'),
                                          Icon(Icons.arrow_drop_down)
                                        ],
                                      );
                                    }).toList();
                                  }
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10..h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SubText(
                              text: 'Period length',
                              fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*.25,
                              child: DropdownButton<String>(
                                  value: selectedValuePeriod,
                                  isExpanded: true,
                                  iconSize: 0,
                                  elevation: 0,
                                  style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  underline: Container(
                                    height: 1,
                                      color: Theme.of(context).focusColor,
                                  ),
                                  dropdownColor: Theme.of(context).hintColor,
                                  menuWidth: 90,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedValuePeriod = newValue!;
                                    });
                                  },
                                  items: periodlength.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Row(
                                        children: [
                                          Text(value),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                  selectedItemBuilder: (BuildContext context) {
                                    return periodlength.map((String value) {
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('$value days'),
                                          Icon(Icons.arrow_drop_down)
                                        ],
                                      );
                                    }).toList();
                                  }
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10..h),
                        Text(
                          'The app makes predictions based on the cycle and period length settings. However, if you regularly log your period in the app,predictions will be based on the logged data.',
                          style: TextStyle(
                              color: Theme.of(context).focusColor,
                              fontSize: 14..sp,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:10..h),
                  Divider(
                    height: 1,
                      color: Theme.of(context).focusColor,
                  ),
                  SizedBox(height: 20..h),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        chance = !chance;
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SubText(
                            text: 'Chance of getting pregnant',
                            fontWeight: FontWeight.w400,
                              color: Theme.of(context).cardColor
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 50,
                            height: 28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: chance
                                  ? AppColor.primaryColor
                                  :  Theme.of(context).focusColor
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: Align(
                                alignment: chance
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
                  SizedBox(height: 10..h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "The chance of getting pregnant is not displayed because you've '"
                                "'activated reminders for contraction. ",
                            style: TextStyle(
                              color: Theme.of(context).focusColor,
                              fontSize: 14..sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: "reminders for contraction.",
                            style: TextStyle(
                              color: AppColor.secondaryColor,
                              fontSize: 14..sp,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColor.secondaryColor
                            ),
                          ),
                          TextSpan(
                            text: " Ovulation will not be shown for methods using hormones",
                            style: TextStyle(
                              color: Theme.of(context).focusColor,
                              fontSize: 14..sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),

                  ),
                  SizedBox(height:10..h),
                  Divider(
                    height: 1,
                      color: Theme.of(context).focusColor,
                  ),
                  SizedBox(height: 20..h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SubText(
                              text: 'Luteal phase',
                              fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*.25,
                              child: DropdownButton<String>(
                                  value: selectedValuePhase,
                                  isExpanded: true,
                                  iconSize: 0,
                                  elevation: 0,
                                  style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  underline: Container(
                                    height: 1,
                                      color: Theme.of(context).focusColor,
                                  ),
                                  dropdownColor:  Theme.of(context).hintColor,
                                  menuWidth: 90,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedValuePhase = newValue!;
                                    });
                                  },
                                  items: phase.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Row(
                                        children: [
                                          Text(value),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                  selectedItemBuilder: (BuildContext context) {
                                    return phase.map((String value) {
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('$value days'),
                                          Icon(Icons.arrow_drop_down)
                                        ],
                                      );
                                    }).toList();
                                  }
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10..h),
                        Text(
                          'Luteal phase is the time between your ovulation and the beginning of your period. '
                              'If you know the length of your luteal phase,log it for more accurate predictions of '
                              'ovulation.',
                          style: TextStyle(
                              color: Theme.of(context).focusColor,
                              fontSize: 14..sp,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:10..h),
                  Divider(
                    height: 1,
                    color: AppColor.black.withOpacity(.25),
                  ),
                  SizedBox(height: 20..h),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        displayCycle = !displayCycle;
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SubText(
                            text: 'Display cycle sequence',
                            fontWeight: FontWeight.w400,
                              color: Theme.of(context).focusColor,
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 50,
                            height: 28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: displayCycle
                                  ? AppColor.primaryColor
                                  : Theme.of(context).shadowColor
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: Align(
                                alignment: displayCycle
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
                  SizedBox(height: 10..h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'The cycle sequence (day 1,2,3, etc.) will be displayed right above the calendar dates.',
                      style: TextStyle(
                          color: Theme.of(context).focusColor,
                          fontSize: 14..sp,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  SizedBox(height: 20..h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Circle 3
                    StepCircle(
                      number: 3,
                      color: AppColor.primaryColor,
                      smallNumber: 5,
                      showSmallNumber: displayCycle,
                    ),
                    StepCircle(
                      number: 4,
                      color: AppColor.primaryColor,
                      smallNumber: 6,
                      showSmallNumber: displayCycle,
                    ),
                    StepCircle(
                      number: 5,
                      color: AppColor.primaryColor,
                      smallNumber: 7,
                      showSmallNumber: displayCycle,
                    ),
                    StepCircle(
                      number: 6,
                      color: AppColor.primaryColor,
                      smallNumber: 8,
                      isOutlined: true,
                      showSmallNumber: displayCycle,
                    ),
                    Text(
                      "7",
                      style: TextStyle(fontSize: 24,color: AppColor.secondaryColor),
                    ),
                    StepCircle(
                      number: 8,
                      color: AppColor.secondaryColor,
                      smallNumber: 10,
                      isOutlined: true,
                      showSmallNumber: displayCycle,
                    ),
                    Text(
                      "9",
                      style: TextStyle(fontSize: 24,color: AppColor.secondaryColor),
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
    );
  }
}

class StepCircle extends StatelessWidget {
  final int number;
  final Color color;
  final int smallNumber;
  final bool isOutlined;
  final bool showSmallNumber;

  const StepCircle({
    Key? key,
    required this.number,
    required this.color,
    required this.smallNumber,
    this.isOutlined = false,
    required this.showSmallNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: isOutlined ? Theme.of(context).hintColor : color,
          child: isOutlined
              ? CircleAvatar(
            radius: 28,
            backgroundColor: Colors.transparent,
            child: Text(
              '$number',
              style: TextStyle(fontSize: 24, color: color),
            ),
          )
              : Text(
            '$number',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
        Visibility(
          visible: showSmallNumber,
          child: Positioned(
            top: 0,
            left: 0,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.grey[200],
              child: Text(
                '$smallNumber',
                style: TextStyle(fontSize: 12, color: AppColor.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}