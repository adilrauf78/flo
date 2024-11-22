import 'package:flo/constants/assets_path.dart';
import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_animation/custom_animation.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flo/view/notification/notification.dart';
import 'package:flo/view/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';


class SecretChat extends StatefulWidget {
  const SecretChat({super.key});

  @override
  State<SecretChat> createState() => _SecretChatState();
}

class _SecretChatState extends State<SecretChat> {
  int currentIndex = 0;
  List<Map<String, dynamic>> items =[
    {'text': 'Popular'},
    {'text': 'Following'},
    {'text': 'Saved'},
    {'text': 'My Comments'},
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
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Column(
              children: [
                SizedBox(height: 45..h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
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
                                prefixIcon: Icon(Iconsax.search_normal, color: Theme.of(context).primaryColor,),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10..w),
                      InkWell(
                          onTap: () => navigateToNextScreen(context, NotificationScreen()),
                          child: Icon(Iconsax.notification, size: 24, color: Theme.of(context).primaryColor,))
                    ],
                  ),
                ),
                SizedBox(height: 15..h),
                SizedBox(
                  height: 35..h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    padding: EdgeInsets.symmetric(horizontal: 15,),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20,),
                            decoration: BoxDecoration(
                              color: currentIndex ==index? AppColor.primaryColor : Theme.of(context).shadowColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: SubText(
                                text: items[index]['text'],
                                color: currentIndex ==index? AppColor.white :  Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10..h),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  IndexedStack(
                    index: currentIndex,
                    children: [
                      Popular(),
                      Following(),
                      Saved(),
                      MyComments(),
                    ],
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


class Popular extends StatefulWidget {
  const Popular({super.key});

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  bool isFollowing = false;
  bool isFavorite = false;
  bool isBookmark = false;
  bool isFavorite1 = false;
  bool isBookmark1 = false;
  List<Map<String, dynamic>> interests =[
    {'text': 'Romantic Relationships','path' : 'assets/images/lesson.jpg', },
    {'text': 'Study','path' : 'assets/images/study.jpg', },
    {'text': 'Romantic Relationships','path' : 'assets/images/lesson.jpg', },
    {'text': 'Study','path' : 'assets/images/study.jpg', },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10..h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40..w,
                    height: 40..h,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor.withOpacity(.2),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                        child: Icon(Icons.image)),
                  ),
                  SizedBox(width: 10..w),
                  Text(
                    'Eating Healthy . ',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16..sp,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFollowing = !isFollowing;
                      });
                    },
                    child: Text(
                      isFollowing ? 'Following' : 'Follow',
                      style: TextStyle(
                        color: isFollowing ? Theme.of(context).focusColor : AppColor.secondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16..sp,
                      ),
                    ),
                  ),
                ],
              ),
              PopupMenuButton<String>(
                icon: Icon(
                  Icons.more_vert_outlined,
                  size: 24,
                  color: Theme.of(context).primaryColor,
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text('Hide this topic'),
                  ),
                  PopupMenuItem(
                    child: Text('Manage your interests'),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 15..h),
        Container(
          width: double.infinity,
          child: Center(
              child: Image.asset('${imagePath}eating.jpg',fit: BoxFit.fill,)),
        ),
        SizedBox(height: 5..h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Theme.of(context).primaryColor,size: 24,
                      ),
                      onPressed: (){
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                    ),
                    Text(
                      '924',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 25..w),
                Row(
                  children: [
                    InkWell(
                      child: Icon(
                        Iconsax.messages_1,
                        color: Theme.of(context).primaryColor,size: 24,
                      )
                    ),
                    SizedBox(width: 10..w),
                    Text(
                      '519',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              icon: Icon(
                isBookmark ? Icons.bookmark : Icons.bookmark_outline_outlined,
                color: isBookmark ?  Theme.of(context).primaryColor : Theme.of(context).primaryColor,size: 24,
              ),
              onPressed: (){
                setState(() {
                  isBookmark = !isBookmark;
                });
              },
            ),
          ],
        ),
        Container(
          width: double.infinity,
          height: 10,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
        ),
        SizedBox(height: 20..h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text24(
                text: 'Interests',
                color: Theme.of(context).primaryColor,
              ),
              Row(
                children: [
                  Text14(
                    text: 'See all',
                    color: AppColor.secondaryColor,
                  ),
                  SizedBox(width: 5..w),
                  Icon(Icons.keyboard_arrow_right_outlined,color: AppColor.secondaryColor,)
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 15..h),
        SizedBox(
          height: 230..h,
          child: ListView.builder(
            itemCount: interests.length,
            padding: EdgeInsets.symmetric(horizontal: 15,),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.only(right: 10,left: 5),
                child: Container(
                  width: 150,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          interests[index]['path'],
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 15..h),
                      Text(
                        textAlign: TextAlign.center,
                        interests[index]['text'],
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18..sp,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },

          ),
        ),
        Container(
          width: double.infinity,
          height: 10,
          decoration: BoxDecoration(
            color: AppColor.black.withOpacity(.1),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 0),
          itemCount: 3,
          itemBuilder: (context,index){
            return Column(
              children: [
                SizedBox(height: 10..h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40..w,
                            height: 40..h,
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor.withOpacity(.2),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                                child: Icon(Icons.image)),
                          ),
                          SizedBox(width: 10..w),
                          Text(
                            'Eating Healthy . ',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16..sp,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isFollowing = !isFollowing;
                              });
                            },
                            child: Text(
                              isFollowing ? 'Following' : 'Follow',
                              style: TextStyle(
                                color: isFollowing ? Theme.of(context).focusColor:AppColor.secondaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16..sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      PopupMenuButton<String>(
                        icon: Icon(
                          Icons.more_vert_outlined,
                          size: 24,
                          color: Theme.of(context).primaryColor,
                        ),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Text('Hide this topic'),
                          ),
                          PopupMenuItem(
                            child: Text('Manage your interests'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15..h),
                Container(
                  width: double.infinity,
                  child: Center(
                      child: Image.asset('${imagePath}eating.jpg',fit: BoxFit.fill,)),
                ),
                SizedBox(height: 5..h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                isFavorite1 ? Icons.favorite : Icons.favorite_border,
                                color: isFavorite1 ? Colors.red : Theme.of(context).primaryColor,size: 24,
                              ),
                              onPressed: (){
                                setState(() {
                                  isFavorite1 = !isFavorite1;
                                });
                              },
                            ),
                            Text(
                              '924',
                              style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 25..w),
                        Row(
                          children: [
                            InkWell(
                                child: Icon(
                                  Iconsax.messages_1,
                                  color: Theme.of(context).primaryColor,size: 24,
                                )
                            ),
                            SizedBox(width: 10..w),
                            Text(
                              '519',
                              style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        isBookmark1 ? Icons.bookmark : Icons.bookmark_outline_outlined,
                        color: isBookmark1 ?  Theme.of(context).primaryColor : Theme.of(context).primaryColor,size: 24,
                      ),
                      onPressed: (){
                        setState(() {
                          isBookmark1 = !isBookmark1;
                        });
                      },
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                  ),
                ),
              ],
            );
          },
        ),
        SizedBox(height: 20..h),
      ],
    );
  }
}


class Following extends StatelessWidget {
  const Following({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(height: 80
            ..h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              child: Image.asset('${imagePath}following.png'),
            ),
          ),
          SizedBox(height: 20
            ..h),
          Text(
            textAlign: TextAlign.center,
            'Nothing here yet. Discover more themes you are interested in,follow and find them anytime!',
            style: TextStyle(
              color: Theme.of(context).focusColor,
              fontSize: 16
                ..sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 15
            ..h),
          Text(
            textAlign: TextAlign.center,
            'Find interesting topics to follow',
            style: TextStyle(
              color: AppColor.primaryColor,
              fontSize: 16
                ..sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20
            ..h),
        ],
      ),
    );
  }
}

class Saved extends StatelessWidget {
  const Saved({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(height: 100
            ..h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              child: Image.asset('${imagePath}saved.png'),
            ),
          ),
          SizedBox(height: 20
            ..h),
          Text(
            textAlign: TextAlign.center,
            'Nothing here yet. Discover more discussions, save and find them anytime!',
            style: TextStyle(
              color: Theme.of(context).focusColor,
              fontSize: 16
                ..sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 15
            ..h),
          Text(
            textAlign: TextAlign.center,
            'Go to Community',
            style: TextStyle(
              color: AppColor.primaryColor,
              fontSize: 16
                ..sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20
            ..h),
        ],
      ),
    );
  }
}

class MyComments extends StatelessWidget {
  const MyComments({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(height: 100
            ..h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              child: Image.asset('${imagePath}saved.png'),
            ),
          ),
          SizedBox(height: 20
            ..h),
          Text(
            textAlign: TextAlign.center,
            'Find all your comments and replies here.',
            style: TextStyle(
              color: Theme.of(context).focusColor,
              fontSize: 16
                ..sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 20
            ..h),
        ],
      ),
    );
  }
}
