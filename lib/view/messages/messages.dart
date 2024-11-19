import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flo/view/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                  },
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
                Row(
                  children: [
                    SizedBox(width: 7),
                    Text(
                      'Messages',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18..sp,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Iconsax.info_circle ,color: Theme.of(context).primaryColor,size: 24),
                    SizedBox(width: 30..w,),
                    Icon(Iconsax.edit,color: Theme.of(context).primaryColor,size: 24),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 25..h),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 3,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width:50..w,
                                  height: 50..h,
                                  decoration: BoxDecoration(
                                    color: AppColor.primaryColor.withOpacity(.3),
                                    shape: BoxShape.circle
                                  ),
                                  child: Icon(Icons.ac_unit_outlined,color: AppColor.primaryColor,)),
                              SizedBox(width: 20..w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Check-in',
                                          style: TextStyle(
                                              color: Theme.of(context).primaryColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18..sp,
                                              overflow: TextOverflow.ellipsis
                                          ),
                                        ),
                                        Text(
                                          'Let\'s talk about chances of co and boosting pleasure',
                                          maxLines: 3,
                                          style: TextStyle(
                                              color: Theme.of(context).primaryColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14..sp,
                                              overflow: TextOverflow.ellipsis
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '8:01 AM',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14..sp,
                                        overflow: TextOverflow.ellipsis
                                    ),
                                  ),
                                  SizedBox(height: 15..h),
                                  Container(
                                    width: 10..w,
                                    height: 10..h,
                                    decoration: BoxDecoration(
                                        color: AppColor.primaryColor,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
