import 'package:flo/constants/assets_path.dart';
import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_animation/custom_animation.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flo/view/insights_screen/trending_now/trending_now.dart';
import 'package:flo/view/notification/notification.dart';
import 'package:flo/view/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class InsightsScreen extends StatefulWidget {
  const InsightsScreen({super.key});

  @override
  State<InsightsScreen> createState() => _InsightsScreenState();
}

class _InsightsScreenState extends State<InsightsScreen> {
  List<Map<String, dynamic>> items =[
    {'text': 'Most Popular in Pregnancy'},
    {'text': 'What do expect this week'},
    {'text': 'Just added'},
    {'text': 'Nutrition need to know'},
    {'text': 'All about your baby'},
    {'text': 'Your Second trimester guide'},
    {'text': 'Most Popular'},
    {'text': 'Bump-friendly self-care'},
    {'text': 'Your birth option'},
    {'text': 'Most Popular'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 15, right: 15, top: 45, bottom: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
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
                SizedBox(width: 10..w),
                Expanded(
                  child: SizedBox(
                    height: 50..h,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.transparent
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.transparent
                              )
                          ),
                          filled: true,
                          hintText: 'Search',
                        hintStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        fillColor: Theme.of(context).shadowColor,
                        prefixIcon: Icon(Iconsax.search_normal,color: Theme.of(context).primaryColor,),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10..w),
                Icon(Icons.bookmarks_outlined,size: 24, color: Theme.of(context).primaryColor,),
                SizedBox(width: 10..w),
                InkWell(
                    onTap: () => navigateToNextScreen(context, NotificationScreen()),
                    child: Icon(Iconsax.notification, size: 24, color: Theme.of(context).primaryColor,))
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
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
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage('${imagePath}growth.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height:5),
                              Text14(
                                text: 'Baby\'s \ngrowth',
                                color: Theme.of(context).primaryColor,
                              )
                            ],
                          ),
                        ),
                        Container(
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
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage('${imagePath}body.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height:5),
                              Text14(
                                color: Theme.of(context).primaryColor,
                                text: 'Body \nChanges',
                              )
                            ],
                          ),
                        ),
                        Container(
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
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage('${imagePath}check.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height:5),
                              Text14(
                                text: 'Pregnancy \nCheckups',
                                color: Theme.of(context).primaryColor,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20..h),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: items.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: MainText(
                                text: items[index]['text'],
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 180,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                padding: EdgeInsets.all(10),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: Container(
                                      width: 140,
                                      decoration: BoxDecoration(
                                        color: Colors.orangeAccent.withOpacity(.5),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: InkWell(
                                        onTap: () => navigateToNextScreen(context, TrendingNow()),
                                        child: Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage('${imagePath}babyy.png'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 5,
                                              right: 5,
                                              left: 5,
                                              child: Text(
                                                "Your baby at 23 weeks",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Theme.of(context).primaryColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
