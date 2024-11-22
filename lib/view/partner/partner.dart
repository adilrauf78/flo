import 'package:flo/constants/assets_path.dart';
import 'package:flo/constants/colors.dart';
import 'package:flo/custom_widget/custom_animation/custom_animation.dart';
import 'package:flo/custom_widget/custom_button/custom_button.dart';
import 'package:flo/custom_widget/custom_text.dart';
import 'package:flo/view/partner/link_partner/link_partner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Partner extends StatefulWidget {
  const Partner({super.key});

  @override
  State<Partner> createState() => _PartnerState();
}

class _PartnerState extends State<Partner> {
  int? expandedIndex;
  final ScrollController _scrollController = ScrollController();
  bool _showLeftArrow = false;
  bool _showRightArrow = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateArrowVisibility();
    });
    _scrollController.addListener(_updateArrowVisibility);
  }

  void _updateArrowVisibility() {
    if (!mounted) return; // Ensure the widget is still in the tree.
    setState(() {
      _showLeftArrow = _scrollController.offset > 0;
      _showRightArrow =
          _scrollController.offset < _scrollController.position.maxScrollExtent;
    });
  }

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 300,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 300,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }
  @override
  Widget build(BuildContext context) {
    bool isExpanded = expandedIndex == 0;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 35..h),
                        Center(
                          child: GradientText(
                            'Flo for Partners',
                            style: TextStyle(
                                fontSize: 32..sp,
                                fontWeight: FontWeight.w600
                            ),
                            colors: [
                              Colors.orangeAccent,
                              AppColor.primaryColor,
                              Colors.blueAccent,
                            ],
                          ),
                        ),
                        SizedBox(height: 15..h),
                        Text24(
                          text: 'Share the journey to pregnancy',
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(height: 25..h),
                        Padding(
                          padding: const EdgeInsets.only(left: 33),
                          child: Text(
                            'Let your partner see your cycle insights',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14..sp,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                        SizedBox(height: 15..h),
                        Row(
                          children: [
                            Icon(Iconsax.tick_circle,size: 18,color: Theme.of(context).primaryColor,),
                            SizedBox(width: 15..w,),
                            Expanded(
                              child: Text(
                                'You\'ll both get guidance on the best time to try.',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 14..sp,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15..h),
                        Row(
                          children: [
                            Icon(Iconsax.tick_circle,size: 18,color: Theme.of(context).primaryColor,),
                            SizedBox(width: 15..w,),
                            Expanded(
                              child: Text(
                                'We\'ll help keep conception sex fun and show him how to plan ahead.',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 14..sp,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15..h),
                        Row(
                          children: [
                            Icon(Iconsax.tick_circle,size: 18,color: Theme.of(context).primaryColor,),
                            SizedBox(width: 15..w,),
                            Expanded(
                              child: Text(
                                'He\'ll  get the lowdown on fertility and ways he can help.',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 14..sp,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30..h),
                        Center(
                          child: Text24(
                            text: 'What your partner sees',
                            fontSize: 18,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(height: 10..h),
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width*.6,
                            child: Image.asset('${imagePath}partner.jpg',fit: BoxFit.cover,),
                          ),
                        ),
                        SizedBox(height: 25..h),
                        Text24(
                          text: '\"My partner now understand my fertile days without me telling him, which is really '
                              'important for us as we\'re trying to conceive.\"',
                          fontSize: 26,
                          color: AppColor.secondaryColor,
                        ),
                        SizedBox(height: 15..h),
                        Center(
                          child: Text(
                            'Katerina, 33',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14..sp,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        SizedBox(height: 5..h),
                        Center(
                          child: Text(
                            'Flo for partners member',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 12..sp,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                        SizedBox(height: 10..h),
                        Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            'Katerina took part in Flo fot partners beta testing and was paid for her time',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 12..sp,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                        SizedBox(height: 25..h),
                        Center(
                          child: Text24(
                            text: 'Get him clued up on you',
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(height: 15..h),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        height: 400,
                        child: ListView.builder(
                          padding: EdgeInsets.only(left: 15,right: 5),
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              width: 230..w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                color: Theme.of(context).hintColor,
                                borderRadius: BorderRadius.circular(10..r),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 20,right: 20,top: 30),
                                    decoration: BoxDecoration(
                                        color: AppColor.black.withOpacity(.1),
                                      borderRadius: BorderRadius.circular(10..r),
                                    ),
                                    child: Image.asset('${imagePath}get.jpg'),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 25,left: 15,right: 30,bottom: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text14(
                                          fontSize: 16,
                                          text: 'Your pregnancy day',
                                          fontWeight: FontWeight.w600,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        SizedBox(height: 5..h,),
                                        Text(
                                          'A view-only version of your current pregnancy day and predictions.',
                                          style: TextStyle(
                                              color: Theme.of(context).primaryColor,
                                              fontSize: 14..sp,
                                              fontWeight: FontWeight.w400
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (_showLeftArrow)
                        Positioned(
                          left: 10,
                          top: 0,
                          bottom: 0,
                          child: InkWell(
                            onTap: _scrollLeft,
                            child: Container(
                              width: 40..w,
                              height: 40..h,
                              decoration: BoxDecoration(
                                color: Theme.of(context).hintColor,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(Icons.arrow_back_ios_outlined,),
                              ),

                            ),
                          ),
                        ),
                      if (_showRightArrow)
                        Positioned(
                          right: 10,
                          top: 0,
                          bottom: 0,
                          child: InkWell(
                            onTap: _scrollRight,
                            child: Container(
                              width: 40..w,
                              height: 40..h,
                              decoration: BoxDecoration(
                                color: Theme.of(context).hintColor,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(Icons.arrow_forward_ios_outlined,),
                              ),

                            ),
                          ),
                        ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        SizedBox(height: 25..h),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: Theme.of(context).hintColor,
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(15..r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Text14(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor,
                                  text: 'Your question answered',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    expandedIndex = isExpanded ? null : 1;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                            color: Theme.of(context).focusColor,
                                            width: .2,
                                          )
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15,),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width:MediaQuery.of(context).size.width*.65,
                                              child: Text(
                                                'What is Flo for partners?',
                                                style: TextStyle(
                                                    color: Theme.of(context).primaryColor,
                                                    fontSize: 14..sp,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ),
                                            Icon(Icons.keyboard_arrow_down,color: Theme.of(context).cardColor,),

                                          ],
                                        ),
                                        if(expandedIndex == 1)
                                          Container(
                                            child: Column(
                                              children: [
                                                SizedBox(height: 15..h),
                                                Text(
                                                  'Flo for Partners is a feature available to all user of your mobile app. You can share your Flo experience with your partner whether you\'re pregnent, trying to conceive or trying to conceive, or tracking your periods.',
                                                  style: TextStyle(
                                                      color: Theme.of(context).cardColor,
                                                      fontSize: 14..sp,
                                                      fontWeight: FontWeight.w400
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    expandedIndex = isExpanded ? null : 2;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                            color: Theme.of(context).focusColor,
                                            width: .2,
                                          )
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15,),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width:MediaQuery.of(context).size.width*.65,
                                              child: Text(
                                                'What is Flo for partners?',
                                                style: TextStyle(
                                                    color: Theme.of(context).primaryColor,
                                                    fontSize: 14..sp,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ),
                                            Icon(Icons.keyboard_arrow_down,color: Theme.of(context).cardColor,),

                                          ],
                                        ),
                                        if(expandedIndex==2)
                                          Container(
                                            child: Column(
                                              children: [
                                                SizedBox(height: 15..h),
                                                Text(
                                                  'Flo for Partners is a feature available to all user of your mobile app. You can share your Flo experience with your partner whether you\'re pregnent, trying to conceive or trying to conceive, or tracking your periods.',
                                                  style: TextStyle(
                                                      color: Theme.of(context).cardColor,
                                                      fontSize: 14..sp,
                                                      fontWeight: FontWeight.w400
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    expandedIndex = isExpanded ? null : 3;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                            color: Theme.of(context).focusColor,
                                            width: .2,
                                          )
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15,),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width:MediaQuery.of(context).size.width*.65,
                                              child: Text(
                                                'Can all couples Flo  for Partners',
                                                style: TextStyle(
                                                    color: Theme.of(context).primaryColor,
                                                    fontSize: 14..sp,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ),
                                            Icon(Icons.keyboard_arrow_down,color: Theme.of(context).cardColor,),

                                          ],
                                        ),
                                        if(expandedIndex==3)
                                          Container(
                                            child: Column(
                                              children: [
                                                SizedBox(height: 15..h),
                                                Text(
                                                  'Flo for Partners is designed to support a male-female couple. This is because Flo '
                                                      'is currently only able to track one menstrual cycle at a time. However, we\'re '
                                                      'continually working to make Flo for Partners more inclusive so we can better serve all coupples.',
                                                  style: TextStyle(
                                                      color: Theme.of(context).cardColor,
                                                      fontSize: 14..sp,
                                                      fontWeight: FontWeight.w400
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    expandedIndex = isExpanded ? null : 4;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                            color: Theme.of(context).focusColor,
                                            width: .2,
                                          )
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15,),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width:MediaQuery.of(context).size.width*.65,
                                              child: Text(
                                                'Can I use Flo Partners with Anonymous Mode?',
                                                style: TextStyle(
                                                    color: Theme.of(context).primaryColor,
                                                    fontSize: 14..sp,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ),
                                            Icon(Icons.keyboard_arrow_down,color: Theme.of(context).cardColor,),

                                          ],
                                        ),
                                        if(expandedIndex==4)
                                          Container(
                                            child: Column(
                                              children: [
                                                SizedBox(height: 15..h),
                                                Text(
                                                  'No, you can\'t use to Flo to Partners and Anonymous Mode at the same time. If you have any further questions, please contact the customer support time.',
                                                  style: TextStyle(
                                                      color: Theme.of(context).cardColor,
                                                      fontSize: 14..sp,
                                                      fontWeight: FontWeight.w400
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    expandedIndex = isExpanded ? null : 5;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                            color: Theme.of(context).focusColor,
                                            width: .2,
                                          )
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15,),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width:MediaQuery.of(context).size.width*.65,
                                              child: Text(
                                                'What do I need to know about couples quizzes?',
                                                style: TextStyle(
                                                    color: Theme.of(context).primaryColor,
                                                    fontSize: 14..sp,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ),
                                            Icon(Icons.keyboard_arrow_down,color: Theme.of(context).cardColor,),

                                          ],
                                        ),
                                        if(expandedIndex==5)
                                          Container(
                                            child: Column(
                                              children: [
                                                SizedBox(height: 15..h),
                                                Text(
                                                  'These are quizzes that you and your partner answer separately. Then when you ha\'ve both completed the quiz, you can see each other\'s answer side by side. Just so you\'re aware you answers will always be visible to your partner, regardless of who answer first or if only one of you respond.',
                                                  style: TextStyle(
                                                      color: Theme.of(context).cardColor,
                                                      fontSize: 14..sp,
                                                      fontWeight: FontWeight.w400
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 25..h),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(horizontal:20,vertical: 20),
                          decoration: BoxDecoration(
                            color: Theme.of(context).hintColor,
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(15..r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text14(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                text: 'Here\'s how to invite your partner:',
                                color: Theme.of(context).primaryColor,
                              ),
                              SizedBox(height: 10..w,),
                              Row(
                                children: [
                                  Container(
                                    width: 60..w,
                                    height: 60..h,
                                    decoration: BoxDecoration(
                                      color: AppColor.backgroundColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Icon(Icons.insert_invitation_outlined,size:30,color: AppColor.black,),
                                    ),
                                  ),
                                  SizedBox(width: 15..w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text14(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          text: '1. INVITE',
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        Text(
                                          'You need to invite your partner to Flo and generate a pairing code.',
                                          style: TextStyle(
                                              color: Theme.of(context).primaryColor,
                                              fontSize: 12..sp,
                                              fontWeight: FontWeight.w400
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 25..h,),
                              Row(
                                children: [
                                  Container(
                                    width: 60..w,
                                    height: 60..h,
                                    decoration: BoxDecoration(
                                      color: AppColor.backgroundColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Icon(Icons.qr_code_scanner_outlined,size:30,color: AppColor.black,),
                                    ),
                                  ),
                                  SizedBox(width: 15..w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text14(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          text: '2. PAIR',
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        Text(
                                          'Your partner will download the Flo app and then use the code to pair your profiles.',
                                          style: TextStyle(
                                              color: Theme.of(context).primaryColor,
                                              fontSize: 12..sp,
                                              fontWeight: FontWeight.w400
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 25..h,),
                              Row(
                                children: [
                                  Container(
                                    width: 60..w,
                                    height: 60..h,
                                    decoration: BoxDecoration(
                                      color: AppColor.backgroundColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Icon(Icons.share_outlined,size:30,color: AppColor.black,),
                                    ),
                                  ),
                                  SizedBox(width: 15..w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text14(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          text: '3. SHARE',
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        Text(
                                          'Once the invite and pairing is done, you\'ll be sharing Flo with your partner.',
                                          style: TextStyle(
                                              color: Theme.of(context).primaryColor,
                                              fontSize: 12..sp,
                                              fontWeight: FontWeight.w400
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 130..h),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Theme.of(context).shadowColor,
                      width: 1,
                    )
                  ),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: InkWell(
                  onTap: () => navigateToNextScreen(context, LinkPartner()),
                  child: CircleButton(
                    text: 'Link your partner',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

