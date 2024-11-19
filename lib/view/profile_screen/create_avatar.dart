import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_animation/custom_animation.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAvatar extends StatefulWidget {
  const CreateAvatar({super.key});

  @override
  State<CreateAvatar> createState() => _CreateAvatarState();
}

class _CreateAvatarState extends State<CreateAvatar> {
  int currentIndex = 0;
  int currentIndex1 = 0;
  IconData selectedIcon = Icons.pets;
  List<Map<String, dynamic>> items = [
    {'color': Colors.red},
    {'color': Colors.blue},
    {'color': Colors.green},
    {'color': Colors.purple},
    {'color': Colors.orange},
    {'color': Colors.teal},
    {'color': Colors.yellow},
    {'color': Colors.pink},
    {'color': Colors.brown},
    {'color': Colors.cyan},
  ];
  List<IconData> gridIcons = [
    Icons.pets,
    Icons.star,
    Icons.face,
    Icons.cake,
    Icons.home,
    Icons.school,
    Icons.work,
    Icons.favorite,
    Icons.accessibility,
    Icons.lightbulb,
    Icons.headphones,
    Icons.directions_bike,
    Icons.airplane_ticket,
    Icons.apple,
    Icons.android,
    Icons.beach_access,
    Icons.book,
    Icons.car_rental,
    Icons.camera,
    Icons.chat,
    Icons.computer,
    Icons.dashboard,
    Icons.fitness_center,
    Icons.golf_course,
    Icons.hotel,
    Icons.icecream,
    Icons.landscape,
    Icons.library_books,
    Icons.lock,
    Icons.map,
    Icons.music_note,
    Icons.phone,
    Icons.print,
    Icons.sports,
    Icons.store,
    Icons.umbrella,
    Icons.wallet_giftcard,
    Icons.watch,
    Icons.wine_bar,
    Icons.yard,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          SizedBox(height: 45..h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () => navigateBackWithAnimation(context),
                        child: Icon(Icons.arrow_back_outlined,size: 24, color: Theme.of(context).primaryColor)),
                    SizedBox(width: 50,),
                    Text(
                      'Create Your Avatar',
                      style: TextStyle(
                      color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18..sp,
                      ),
                    ),
                  ],
                ),
                Text14(
                  text: 'Save',
                  color: AppColor.primaryColor,
                )
              ],
            ),
          ),
          SizedBox(height: 45..h),
          Container(
            width: 160..w,
            height: 160..h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: items[currentIndex]['color'],
            ),
            child: Center(
              child: Icon(selectedIcon, color: Colors.white, size: 100),
            ),
          ),
          SizedBox(height: 25..h),
          SizedBox(
            height: 50..h,
            child: ListView.builder(
              itemCount: items.length,
              padding: EdgeInsets.only(left: 15,right: 10),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                final color = items[index]['color'];
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: currentIndex ==index? AppColor.primaryColor : Colors.transparent,
                          width: 1.5,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        width: 40..w,
                        height: 40..h,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10..h,),
          Divider(
            color: Theme.of(context).primaryColor,
            height: 0,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10..h),
                  GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(16),
                    itemCount: gridIcons.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            currentIndex1 = index;
                            selectedIcon = gridIcons[index];
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: currentIndex1 ==index? AppColor.primaryColor : Colors.transparent,
                              width: 1.5,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            width: 50..w,
                            height: 50..h,
                            decoration: BoxDecoration(
                              color: Theme.of(context).shadowColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(gridIcons[index], color: Colors.white, size: 35),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
