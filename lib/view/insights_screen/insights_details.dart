import 'package:flo/constants/assets_path.dart';
import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_animation/custom_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InsightsDetails extends StatelessWidget {
  const InsightsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 45..h),
            Row(
              children: [
                InkWell(
                    onTap: () => navigateBackWithAnimation(context),
                    child: Icon(Icons.arrow_back_outlined,size: 24, color: Theme.of(context).primaryColor)),
                SizedBox(width: 50,),
                Text(
                  'Insights',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18..sp,
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10..h),
                    Text(
                      'Physical signs that your fertile',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 26..sp,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    SizedBox(height: 10..h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.primaryColor
                          ),
                          child: Center(child: Icon(Icons.image,size: 15,)),
                        ),
                        SizedBox(width: 15..w,),
                        Expanded(
                          child: Text(
                            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using' 'Content here, content here',
                            style: TextStyle(
                              color: Theme.of(context).cardColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 12..sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250..h,
                      child: Image.asset('${imagePath}trending.jpg',fit: BoxFit.fill,),
                    ),
                    SizedBox(height: 20..h,),
                    Text(
                      'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using' 'Content here, content here It is a long established fact that a reader will be distracted by the readable content  It is a long established fact that a reader will be distracted by the readable content  It is a long established fact that a reader will be distracted by the readable content  It is a long established fact that a reader will be distracted by the readable content ',
                      style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12..sp,
                      ),
                    ),
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
                                              color: Theme.of(context).primaryColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          'The second trimester brings the need for a slight',
                                          style: TextStyle(
                                            color: Theme.of(context).cardColor,
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
                    SizedBox(height: 20..h,),
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
