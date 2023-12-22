// ignore_for_file: camel_case_types

import 'package:create_app/config/app_routes.dart';
import 'package:create_app/model/user.dart';
import 'package:create_app/styles/app_colors.dart';
import 'package:create_app/user_provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      user: User(
        1,
        'Test',
        'Test',
        'mobile',
        'birthday',
        'gender',
        false,
      ),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Urbanist',
          scaffoldBackgroundColor: AppColors.background,
          brightness: Brightness.dark,
        ),
        initialRoute: AppRoutes.login,
        routes: AppRoutes.pages,
      ),
    );
  }
}
