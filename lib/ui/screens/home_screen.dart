import 'package:flutter/material.dart';
import 'package:rafik/ui/screens/emergencty_tab_screen.dart';
import 'package:rafik/ui/screens/home_tab.dart';
import 'package:rafik/ui/screens/informs_screen.dart';
import 'package:rafik/ui/screens/login_screeen.dart';

import '../utlities/app_colors.dart';
import '../utlities/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currenttabindex = 0;

  List<Widget> tabs = [
    HomeTab(),
    EmergencyTab(),
    InformsScreen(),
    LoginScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNav(),
      body: tabs[currenttabindex],
    );
  }

  Widget buildBottomNav() => Theme(
      data: Theme.of(context)
          .copyWith(canvasColor: Theme.of(context).cardColor),
      child: BottomNavigationBar(
        unselectedItemColor: AppColors.navColor,
        selectedItemColor: AppColors.login_Info_Color,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: AppColors.white,
        elevation: 10,
        selectedLabelStyle: AppTheme.selectedItemStyle,
        unselectedLabelStyle:
            AppTheme.selectedItemStyle.copyWith(color: AppColors.navColor),
        currentIndex: currenttabindex,
        onTap: (index) {
          currenttabindex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
              icon: Image.asset("assets/images/home 1x.png"), label: "Home"),
          BottomNavigationBarItem(
              icon: Image.asset("assets/images/setting1x.png"),
              label: "Emergency"),
          BottomNavigationBarItem(
              icon: Image.asset("assets/images/informs 1x.png"),
              label: "Inform"),
          BottomNavigationBarItem(
              icon: Image.asset("assets/images/message 1x.png"),
              label: "Message"),
        ],
      ));
}
