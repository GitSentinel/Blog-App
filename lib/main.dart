import 'package:create_app/pages/edit_profile_page.dart';
import 'package:create_app/pages/home_page.dart';
import 'package:create_app/pages/login_page.dart';
import 'package:create_app/pages/main_page.dart';
import 'package:create_app/styles/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Urbanist',
        scaffoldBackgroundColor: AppColors.background,
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/main': (context) => MainPage(),
        '/edit-profile': (context) => EditProfilePage(),
      },
    );
  }
}
