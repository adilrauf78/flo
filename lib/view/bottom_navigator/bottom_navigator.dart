import 'package:flo/constants/colors.dart';
import 'package:flo/view/insights_screen/insights_screen.dart';
import 'package:flo/view/messages/messages.dart';
import 'package:flo/view/partner/partner.dart';
import 'package:flo/view/secret_chat/secret_chat.dart';
import 'package:flo/view/today_screen/today_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';

class NavigationScreen extends StatefulWidget {
  final int currentTab;
  const NavigationScreen({Key? key, required this.currentTab}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late int currentTab;

  @override
  void initState() {
    super.initState();
    currentTab = widget.currentTab;
  }

  final List<Widget> _pages = [
    TodayScreen(),
    InsightsScreen(),
    SecretChat(),
    Messages(),
    Partner(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentTab,
        onTap: (index) {
          setState(() {
            currentTab = index;
          });
        },
        selectedItemColor: AppColor.secondaryColor,
        unselectedItemColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).hintColor,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Iconsax.calendar_1,
              size: 24,
              color: currentTab == 0 ? AppColor.secondaryColor : Theme.of(context).cardColor,
            ),
            label: 'Today',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Iconsax.element_3,
              size: 24,
              color: currentTab == 1 ? AppColor.secondaryColor : Theme.of(context).cardColor,
            ),
            label: 'Insights',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.question_answer_outlined,
              size: 24,
              color: currentTab == 2 ? AppColor.secondaryColor : Theme.of(context).cardColor,
            ),
            label: 'Secret Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Iconsax.message,
              size: 24,
              color: currentTab == 3 ? AppColor.secondaryColor : Theme.of(context).cardColor,
            ),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Iconsax.profile_2user,
              size: 24,
              color: currentTab == 4 ? AppColor.secondaryColor : Theme.of(context).cardColor,
            ),
            label: 'Partner',
          ),
        ],
      ),
      body: _pages[currentTab],
    );
  }
}


