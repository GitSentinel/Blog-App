// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:create_app/components/bottom_navigation_item.dart';
import 'package:create_app/config/app_icons.dart';
import 'package:create_app/config/app_strings.dart';
import 'package:create_app/pages/home_page.dart';
import 'package:create_app/pages/profile_page.dart';
import 'package:create_app/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Menus currentIndex = Menus.home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[currentIndex.index],
      bottomNavigationBar: MyBottonNavigation(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(
            () {
              currentIndex = value;
            },
          );
        },
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

enum Menus {
  home,
  favorite,
  add,
  chat,
  profile,
}

class MyBottonNavigation extends StatelessWidget {
  final Menus currentIndex;
  final ValueChanged<Menus> onTap;
  const MyBottonNavigation(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87,
      margin: EdgeInsets.all(24),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            top: 17,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ButtonNavigationItem(
                      onPressed: () => onTap(Menus.home),
                      icon: AppIcons.home,
                      current: currentIndex,
                      name: Menus.home,
                    ),
                  ),
                  Expanded(
                    child: ButtonNavigationItem(
                      onPressed: () => onTap(Menus.favorite),
                      icon: AppIcons.favorite,
                      current: currentIndex,
                      name: Menus.favorite,
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: ButtonNavigationItem(
                      onPressed: () => onTap(Menus.chat),
                      icon: AppIcons.chat,
                      current: currentIndex,
                      name: Menus.chat,
                    ),
                  ),
                  Expanded(
                    child: ButtonNavigationItem(
                      onPressed: () => onTap(Menus.profile),
                      icon: AppIcons.profile,
                      current: currentIndex,
                      name: Menus.profile,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: () => onTap(Menus.add),
              child: Container(
                width: 64,
                height: 64,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(AppIcons.add),
              ),
            ),
          )
        ],
      ),
    );
  }
}
