import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_animation/custom_animation.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LifeCycleSettings extends StatefulWidget {
  const LifeCycleSettings({super.key});

  @override
  State<LifeCycleSettings> createState() => _LifeCycleSettingsState();
}

class _LifeCycleSettingsState extends State<LifeCycleSettings> {
  String selectedValue = '5';
  final List<String> dropdownItems = [
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
  ];
  String selectedValuewater = '32';
  final List<String> waterintake = [
    for (int i = 32; i <= 160; i += 8) i.toString(),
  ];
  String selectedValuestep = '5000';
  final List<String> steptarget = [
    for (int i = 5000; i <= 10000; i += 500) i.toString(),
  ];
  String selectedValuetarget = '44';
  final List<String> targetweight = [
    for (int i = 44; i <= 150; i += 1) i.toString(),
  ];
  String selectedheight = '2\' 11\"';
  final List<String> height = [
    for (int i = (2 * 12 + 11); i <= (5 * 12 + 2); i++)
      '${(i ~/ 12)}\' ${(i % 12)}"',
  ];
  String selectedValuecalorie = '1000';
  final List<String> calorieintake = [
    for (int i = 1000; i <= 2500; i += 100) i.toString(),
  ];
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
                  'Lifestyle settings',
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
                    SizedBox(height: 15..h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SubText(
                          color: Theme.of(context).primaryColor,
                          text: 'Normal Sleep duration',
                          fontWeight: FontWeight.w400,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*.25,
                          child: DropdownButton<String>(
                              value: selectedValue,
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
                                  selectedValue = newValue!;
                                });
                              },
                              items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
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
                                return dropdownItems.map((String value) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('$value h'),
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
                      'Most people need 7-9 hours of sleep to feel rested.',
                      style: TextStyle(
                          color: Theme.of(context).focusColor,
                          fontSize: 14..sp,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    SizedBox(height: 10..h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SubText(
                          text: 'Normal water intake',
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w400,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*.25,
                          child: DropdownButton<String>(
                              value: selectedValuewater,
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
                                  selectedValuewater = newValue!;
                                });
                              },
                              items: waterintake.map<DropdownMenuItem<String>>((String value) {
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
                                return waterintake.map((String value) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('$value fI oz'),
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
                      'An average person drinks about 64fI oz of water a day.',
                      style: TextStyle(
                          color: Theme.of(context).focusColor,
                          fontSize: 14..sp,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    SizedBox(height: 20..h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SubText(
                          text: 'Step target',
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*.25,
                          child: DropdownButton<String>(
                              value: selectedValuestep,
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
                                  selectedValuestep = newValue!;
                                });
                              },
                              items: steptarget.map<DropdownMenuItem<String>>((String value) {
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
                                return steptarget.map((String value) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(value),
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
                      'It\'s recommended to take at least 10,000 steps daily.',
                      style: TextStyle(
                          color: Theme.of(context).focusColor,
                          fontSize: 14..sp,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    SizedBox(height: 20..h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SubText(
                          color: Theme.of(context).primaryColor,
                          text: 'Target weight',
                          fontWeight: FontWeight.w400,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*.25,
                          child: DropdownButton<String>(
                              value: selectedValuetarget,
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
                                  selectedValuetarget = newValue!;
                                });
                              },
                              items: targetweight.map<DropdownMenuItem<String>>((String value) {
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
                                return targetweight.map((String value) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${value} lbs'),
                                      Icon(Icons.arrow_drop_down)
                                    ],
                                  );
                                }).toList();
                              }
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20..h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SubText(
                          text: 'Height',
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w400,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*.25,
                          child: DropdownButton<String>(
                              value: selectedheight,
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
                                  selectedheight = newValue!;
                                });
                              },
                              items: height.map<DropdownMenuItem<String>>((String value) {
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
                                return height.map((String value) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${value}'),
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
                      'Flo will use your height to calculate your body mass index. It will help make more precise cycle predictions.',
                      style: TextStyle(
                          color: Theme.of(context).focusColor,
                          fontSize: 14..sp,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    SizedBox(height: 20..h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SubText(
                          text: 'Normal calorie intake',
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*.25,
                          child: DropdownButton<String>(
                              value: selectedValuecalorie,
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
                                  selectedValuecalorie = newValue!;
                                });
                              },
                              items: calorieintake.map<DropdownMenuItem<String>>((String value) {
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
                                return calorieintake.map((String value) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${value} cal'),
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
                      'Consuming 2,200 calories per day is enough for the average person, but you may have your own '
                          'daily normal calories intake. Such intake depends on your overall health condition, diet '
                          'physical activity and others. In future updates, Flo will calculate your individual daily '
                          'calorie intake based on these parameters.',
                      style: TextStyle(
                          color: Theme.of(context).focusColor,
                          fontSize: 14..sp,
                          fontWeight: FontWeight.w400
                      ),
                    ),
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
