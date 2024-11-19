import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_animation/custom_animation.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class GetPregnant extends StatefulWidget {
  const GetPregnant({super.key});

  @override
  State<GetPregnant> createState() => _GetPregnantState();
}

class _GetPregnantState extends State<GetPregnant> {
  String selectedWeeks = '0';
  final List<String> dropdownItems = [
    '0',
    '1',
    '2',
  ];
  String selectedDay = '1';
  final List<String> dropdownDay = [
    '1',
    '2',
  ];
  String selectedChildren = '1';
  final List<String> dropdownChildren = [
    '1',
    '2 or more',
  ];
  void _showCustomPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            decoration: BoxDecoration(
                color: AppColor.backgroundColor,
                borderRadius: BorderRadius.circular(15)
            ),
            padding: EdgeInsets.only(left: 15,right: 15,bottom: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20..h,),
                Text14(
                  text: 'Delete Pregnancy info',
                  fontSize: 16.sp,
                ),
                SizedBox(height: 10..h),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(
                    'This will permanently delete all data about this pregnancy from the Flo app.',
                    style: TextStyle(
                      color: AppColor.black.withOpacity(.5),
                      fontSize: 14..sp,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ),
                SizedBox(height: 25..h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Text14(
                        text: 'Cancel',
                        color: AppColor.secondaryColor,
                      ),
                    ),
                    SizedBox(width: 20..w),
                    Text14(
                      text: 'Remove',
                      color: AppColor.secondaryColor,
                    ),

                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  String displayText = 'Select';

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),

    );

    if (pickedDate != null) {
      setState(() {
        displayText = DateFormat('MMM dd, yyyy').format(pickedDate);
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
                    child: Icon(Icons.arrow_back_outlined,size: 24,color: Theme.of(context).primaryColor)),
                SizedBox(width: 50,),
                Text(
                  'Pregnancy Mode',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18..sp,
                  ),
                ),

              ],
            ),
            SizedBox(height: 30..h),
            Text14(
              text: 'Gestational age',
              color: Theme.of(context).primaryColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*.4,
                  child: DropdownButton<String>(
                      value: selectedWeeks,
                      isExpanded: true,
                      iconSize: 0,
                      elevation: 0,
                      style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      underline: Container(
                        height: 1,color: Theme.of(context).focusColor,
                      ),
                      dropdownColor: Theme.of(context).hintColor,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedWeeks = newValue!;
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
                              Text('Weeks $value'),
                              Icon(Icons.arrow_drop_down)
                            ],
                          );
                        }).toList();
                      }
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*.4,
                  child: DropdownButton<String>(
                      value: selectedDay,
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
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedDay = newValue!;
                        });
                      },
                      items: dropdownDay.map<DropdownMenuItem<String>>((String value) {
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
                        return dropdownDay.map((String value) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Day $value',),
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
            Text14(
              text: 'How is it calculated?',
              color: AppColor.secondaryColor,
              fontWeight: FontWeight.w400,
              ),
            SizedBox(height: 15..h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text18(
                  text: 'Number of children',
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16..sp,
                ),
                Container(
                  width: MediaQuery.of(context).size.width*.4,
                  child: DropdownButton<String>(
                      value: selectedChildren,
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
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedChildren = newValue!;
                        });
                      },
                      items: dropdownChildren.map<DropdownMenuItem<String>>((String value) {
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
                        return dropdownChildren.map((String value) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('$value'),
                              Icon(Icons.arrow_drop_down)
                            ],
                          );
                        }).toList();
                      }
                  ),
                ),
              ],
            ),
            SizedBox(height: 15..h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text18(
                  text: 'Due Date',
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).primaryColor,
                  fontSize: 16..sp,
                ),
                GestureDetector(
                  onTap: _selectDate,
                  child: Container(
                    width: MediaQuery.of(context).size.width*.4,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,color: Theme.of(context).focusColor,
                        )
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          displayText,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        ),
                        Icon(Icons.arrow_drop_down)
                      ],
                    )
                  ),
                ),
              ],
            ),
            SizedBox(height: 30..h),
            InkWell(
              onTap: (){
                _showCustomPopup(context);
              },
              child: Center(
                child: Text14(
                  text: 'REMOVE PREGNANCY INFORMATION',
                  fontWeight: FontWeight.w500,
                  color: AppColor.secondaryColor,
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
