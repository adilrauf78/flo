import 'package:flo/constants/assets_path.dart';
import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_animation/custom_animation.dart';
import 'package:flo/custom_widget/custom_button/custom_button.dart';
import 'package:flo/custom_widget/custom_clipper/custom_clipper.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flo/view/bottom_navigator/bottom_navigator.dart';
import 'package:flo/view/insights_screen/insights_details.dart';
import 'package:flo/view/partner/link_partner/link_partner.dart';
import 'package:flo/view/profile_screen/profile_screen.dart';
import 'package:flo/view/today_screen/calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }
  DateTime _selectedDate = DateTime.now();
  final PageController _pageController = PageController();
  final ScrollController _scrollController = ScrollController();

  bool isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }




  String getWeeksAndDaysSince(DateTime startDate) {
    final difference = _selectedDate.difference(startDate).inDays + 1;
    final weeks = difference ~/ 7;
    final days = difference % 7;

    if (weeks == 0) {
      return "$days days";
    } else if (days == 0) {
      return "$weeks weeks";
    } else {
      return "$weeks weeks, $days days";
    }
  }
  int getPageIndexForDate(DateTime date) {
    return date.difference(DateTime.now()).inDays;
  }

  @override
  Widget build(BuildContext context) {
    DateTime startDate = DateTime.now();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 45, bottom: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [
                  Colors.orangeAccent.withOpacity(.5),
                  Colors.orangeAccent.withOpacity(.3),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => navigateToNextScreen(context, ProfileScreen()),
                  child: Stack(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(Icons.pets, color: Colors.white, size: 15),
                        ),
                      ),
                      Positioned(
                        top: 2,
                        right: 2,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SubText(
                  text: DateFormat('MMMM d').format(_selectedDate),
                ),

                InkWell(
                    onTap: () => navigateToNextScreen(context, CustomCalendarScreen()),
                    child: Icon(Iconsax.calendar_1, size: 24, color: Theme.of(context).primaryColor,)),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipPath(
                    clipper: SmoothBottomClipper(),
                    child: Container(
                      width: double.infinity,
                      height: 450,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topRight,
                          colors: [
                            Colors.orangeAccent,
                            Colors.orangeAccent.withOpacity(.3),
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          SizedBox(
                            height: 80,
                            child: ListView.builder(
                              controller: _scrollController,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                DateTime weekDay = DateTime.now().add(Duration(days: index));
                                bool isToday = isSameDate(weekDay, DateTime.now());
                                bool isSelected = isSameDate(weekDay, _selectedDate);

                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedDate = weekDay;
                                    });
                                    int pageIndex = getPageIndexForDate(weekDay);
                                    _pageController.jumpToPage(pageIndex);
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        DateFormat('E').format(weekDay).substring(0, 1),
                                        style: TextStyle(fontSize: 12, color: Colors.black),
                                      ),
                                      SizedBox(height: 4),
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: isSelected ?  Theme.of(context).hintColor : Colors.transparent,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Text(
                                            DateFormat.d().format(weekDay),
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.orange,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('${imagePath}baby.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          Container(
                            height: 60,
                            child: PageView.builder(
                              pageSnapping: true,
                              controller: _pageController,
                              onPageChanged: (pageIndex) {
                                setState(() {
                                  _selectedDate = DateTime.now().add(Duration(days: pageIndex));  // Change date when page is changed
                                });
                              },
                              itemBuilder: (context,index){

                                return Center(
                                  child: MainText(
                                    text: getWeeksAndDaysSince(startDate),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.white,
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: 130..w,
                            height: 35..h,
                            child: ElevatedButton(
                              onPressed: () => navigateToNextScreen(context, CustomCalendarScreen()),
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: AppColor.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: Center(
                                child: SubText(
                                  text: 'Details',
                                  color: Colors.orangeAccent,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15..h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: MainText(
                              text: 'My daily insights . ${DateFormat('MMM d').format(_selectedDate)}'
                          )
                      ),
                      SizedBox(height: 5..h),
                      SizedBox(
                        height: 160,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          padding: EdgeInsets.all(10),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                width: 120,
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColor.primaryColor,
                                      width: 2
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.orangeAccent,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10..r),
                                          topRight: Radius.circular(10..r),
                                        ),
                                      ),
                                      child: Text(
                                        "Your baby at 23 weeks",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage('${imagePath}baby.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 5..h),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: MainText(
                                  text: 'What to expect at 21 Weeks',
                                ),
                              ),
                              Divider(
                                color: AppColor.backgroundColor,
                              ),
                              SizedBox(height: 10..h),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 45,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(50),
                                                borderSide: BorderSide(
                                                    color: Colors.transparent
                                                )
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(50),
                                                borderSide: BorderSide(
                                                    color: Colors.transparent
                                                )
                                            ),
                                            filled: true,
                                            hintText: 'Search articles,videos',
                                            fillColor: AppColor.black.withOpacity(.1),
                                            prefixIcon: Icon(Iconsax.search_normal, color: AppColor.black.withOpacity(0.6))
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15..h),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width:70..w,
                                          padding: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              color: Colors.transparent
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 45..w,
                                                height: 45..h,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage('${imagePath}growth.png'),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height:5),
                                              Text14(
                                                text: 'Baby\'s growth',
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width:70..w,
                                          padding: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              color: Colors.transparent
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 45..w,
                                                height: 45..h,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage('${imagePath}body.png'),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height:5),
                                              Text14(
                                                text: 'Body Changes',
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width:70..w,
                                          padding: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              color: Colors.transparent
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 45..w,
                                                height: 45..h,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage('${imagePath}check.png'),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height:5),
                                              Text14(
                                                text: 'Pregnancy Checkups',
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10..h),
                                    MainText(
                                      text: 'Based on your Current trimester',
                                    ),
                                    SizedBox(height: 10..h),
                                    ListView.builder(
                                      itemCount: 3,
                                      physics: NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemBuilder: (context,index){
                                        return GestureDetector(
                                          onTap: () => navigateToNextScreen(context, InsightsDetails()),
                                          child: Padding(
                                            padding: const EdgeInsets.only(bottom: 10),
                                            child: Container(
                                              width: double.infinity,
                                              padding: EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                              ),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 70..w,
                                                    height: 70..h,
                                                    decoration: BoxDecoration(
                                                      color: Colors.amberAccent.withOpacity(.4),
                                                      borderRadius: BorderRadius.circular(10),
                                                      image: DecorationImage(
                                                        image: AssetImage('${imagePath}baby.png'),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10..w),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          maxLines: 2,
                                                          'Handy food hacks for your 2nd trimester',
                                                          style: TextStyle(
                                                              color: AppColor.black,
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 16
                                                          ),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                        Text(
                                                          'The second trimester brings the need for a slight',
                                                          style: TextStyle(
                                                            color: AppColor.black.withOpacity(.5),
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                          overflow: TextOverflow.ellipsis,
                                                        )
                                                      ],
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    SizedBox(height: 10..h),
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationScreen(currentTab: 1,)));
                                      },
                                        child: Container(
                                          width: double.infinity,
                                            height: 45..h,
                                            decoration: BoxDecoration(
                                              color: AppColor.black.withOpacity(.1),
                                              borderRadius: BorderRadius.circular(50..r)
                                            ),
                                            child: Center(
                                              child: Text(
                                                'See more',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16..sp,
                                                  color: AppColor.black,
                                                ),
                                              ),
                                            ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
