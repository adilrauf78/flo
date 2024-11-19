import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_animation/custom_animation.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrinkWater extends StatefulWidget {
  const DrinkWater({super.key});

  @override
  State<DrinkWater> createState() => _DrinkWaterState();
}

class _DrinkWaterState extends State<DrinkWater> {
  String selectedValue = '3';
  final List<String> dropdownItems = [
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
  ];
  bool periodStart = true;
  bool _isTextChanged = false;
  final TextEditingController _controller = TextEditingController();
  String initialText = 'It\'s time to drink water and log the data in the app!';


  @override
  void initState() {
    super.initState();
    _controller.text = initialText;
  }
  TimeOfDay selectedTime = TimeOfDay(hour: 9, minute: 0);
  TimeOfDay selectedTime1 = TimeOfDay(hour: 12, minute: 0);

  Future<void> _selectTime(BuildContext context) async {
    // Show time picker
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }
  Future<void> _selectTime1(BuildContext context) async {
    // Show time picker
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime1,
    );
    if (picked != null && picked != selectedTime1) {
      setState(() {
        selectedTime1 = picked;
      });
    }
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
                  child: Icon(Icons.arrow_back_outlined, size: 24, color: Theme.of(context).primaryColor,),
                ),
                SizedBox(width: 50),
                Text(
                  'Reminder',
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
                  periodStart = !periodStart;
                });
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SubText(
                      text: 'Drink Water',
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 50,
                      height: 28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: periodStart
                            ? AppColor.primaryColor
                            :  Theme.of(context).shadowColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Align(
                          alignment: periodStart
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
            SizedBox(height: 15..h),
            Opacity(
              opacity: periodStart ? 1.0 : 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubText(
                    text: 'Start time',
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColor,
                  ),
                  InkWell(
                    onTap: () => periodStart ? _selectTime(context) : null,
                    child: Container(
                      width: MediaQuery.of(context).size.width * .3,
                      padding: EdgeInsets.symmetric(vertical: 3),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: Theme.of(context).focusColor,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SubText(
                            text: '${selectedTime.format(context)}',
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor,
                          ),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15..h),
            Opacity(
              opacity: periodStart ? 1.0 : 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubText(
                    text: 'End time',
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColor,
                  ),
                  InkWell(
                    onTap: () => periodStart ? _selectTime1(context) : null,
                    child: Container(
                      width: MediaQuery.of(context).size.width * .3,
                      padding: EdgeInsets.symmetric(vertical: 3),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: Theme.of(context).shadowColor,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SubText(
                            text: '${selectedTime1.format(context)}',
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor,
                          ),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15..h),
            Opacity(
              opacity: periodStart ? 1.0 : 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubText(
                    text: 'Interval',
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColor,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*.3,
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
                          color: Theme.of(context).shadowColor,
                        ),
                        dropdownColor: Theme.of(context).hintColor,
                        menuWidth: 90,
                        onChanged: periodStart
                            ? (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        }
                            : null,
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
            ),
            SizedBox(height: 15..h),
            Opacity(
              opacity: periodStart ? 1.0 : 0.5,
              child: Text(
                'Reminders to drink water will be shown within the chosen interval',
                style: TextStyle(
                  color: Theme.of(context).focusColor,
                  fontSize: 14..sp,
                ),
              ),
            ),
            SizedBox(height:5..h),
            Divider(
              height: 1,
              color: Theme.of(context).focusColor,
            ),
            SizedBox(height: 25..h),
            Opacity(
              opacity: periodStart ? 1.0 : 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text14(
                    text: 'Text of the Reminder:',
                    color: Theme.of(context).focusColor,
                  ),
                  SizedBox(height: 10..w),
                  Container(
                    width: double.infinity,
                    child: TextField(
                      controller: _controller,
                      enabled: periodStart, // Disable input when toggled off
                      minLines: 1,
                      maxLines: 5,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Theme.of(context).focusColor,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: AppColor.secondaryColor,
                          ),
                        ),
                      ),
                      onChanged: (text) {
                        if (periodStart) {
                          setState(() {
                            _isTextChanged = true;
                          });
                        }
                      },
                      onSubmitted: (text) {
                        if (periodStart) {
                          setState(() {
                            initialText = text;
                            _isTextChanged = false;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20..h),
          ],
        ),
      ),
    );
  }
}
