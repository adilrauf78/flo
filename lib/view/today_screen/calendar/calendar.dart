import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_button/custom_button.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CustomCalendarScreen extends StatefulWidget {
  @override
  _CustomCalendarScreenState createState() => _CustomCalendarScreenState();
}

class _CustomCalendarScreenState extends State<CustomCalendarScreen> {
  bool isMonthView = true; // Toggle between month and year view
  DateTime? selectedDate;
  List<DateTime> selectedDates = []; // List to track selected dates
  DateTime selectedYear = DateTime.now();
  bool showBottomButton = false; // To control the visibility of the bottom button
  bool showCircle = false; // To control the visibility of the circles under dates

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              // Header with Toggle Switch
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 45, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close, size: 24, color: Colors.black),
                    ),
                    Text24(
                      text: 'Calendar',
                      fontWeight: FontWeight.w700,
                      color: AppColor.black,
                    ),
                    Container(width: 25,)
                  ],
                ),
              ),
              Divider(
                color: Colors.black.withOpacity(.2),
              ),
              // Calendar View
              Expanded(
                child: buildMonthView()
              ),
            ],
          ),
          // Bottom Button
          if (showBottomButton)
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: InkWell(
                onTap: () {
                  setState(() {
                    showCircle = true; // Display circles below selected dates
                  });
                },
                child: QuestionButton(
                  text: 'Save',
                ),
              )
            ),
        ],
      ),
    );
  }

  /// Month View Builder
  Widget buildMonthView() {
    return PagedVerticalCalendar(
      invisibleMonthsThreshold: 1,
      startWeekWithSunday: true,
      initialDate: DateTime.now(),
      maxDate: DateTime.now().add(Duration(days: 365)),
      dayBuilder: (context, date) {
        bool isToday = date.year == DateTime.now().year &&
            date.month == DateTime.now().month &&
            date.day == DateTime.now().day; // Check for today's date
        bool isSelected = selectedDates.contains(date);
        bool hasCircle = selectedDates.contains(date);

        return GestureDetector(
          onTap: () {
            setState(() {
              if (isSelected) {
                selectedDates.remove(date); // Remove from selection
              } else {
                selectedDates.add(date); // Add to selection
              }
              showBottomButton = selectedDates.isNotEmpty; // Show button if a date is selected
            });
          },
          child: Center(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Circle Background for the Date
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColor.primaryColor
                            : isToday
                            ? Colors.blue
                            : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                    ),
                    // Date Text
                    Text(
                      '${date.day}',
                      style: TextStyle(
                        color: isSelected || isToday ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // Tick Icon for Selected Dates

                  ],
                ),
                // Circle Below Selected Da
              ],
            ),
          ),
        );
      },
    );
  }


}
