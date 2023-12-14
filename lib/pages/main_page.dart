// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:create_app/config/app_icons.dart';
import 'package:create_app/config/app_strings.dart';
import 'package:create_app/pages/home_page.dart';
import 'package:create_app/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.home),
            label: AppStrings.home,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.favorite),
            label: AppStrings.favorites,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.add),
            label: AppStrings.add,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.chat),
            label: AppStrings.chat,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.profile),
            label: AppStrings.profile,
          ),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.amber,
      ),
    );
  }

  final pages = [
    HomePage(),
    Center(
      child: Text(AppStrings.favorites),
    ),
    Center(
      child: Text(AppStrings.add),
    ),
    Center(
      child: Text(AppStrings.chat),
    ),
    ProfilePage(),
  ];
}
