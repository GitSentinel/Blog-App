// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:create_app/components/app_text_field.dart';
import 'package:create_app/config/app_icons.dart';
import 'package:create_app/config/app_routes.dart';
import 'package:create_app/config/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'http://localhost:8080';

class LoginPage extends StatelessWidget {
  final loginRoute = '$baseUrl/login';
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                Spacer(),
                Text(
                  AppStrings.helloWelcome,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  AppStrings.loginToContinue,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      hintText: AppStrings.username,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5)),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: AppStrings.password,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      print('Forgot is Clicked');
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                    ),
                    child: Text(AppStrings.forgotPassword),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      doLogin();
                      // Navigator.of(context)
                      //     .pushReplacementNamed(AppRoutes.main);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                    ),
                    child: Text(
                      AppStrings.loginToContinue,
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  AppStrings.orSignInWith,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      print('Login with Google');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppIcons.google,
                          width: 22,
                          height: 22,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          AppStrings.loginWithGoogle,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      print('Login with Facebook');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppIcons.facebook,
                          width: 22,
                          height: 22,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          AppStrings.loginWithFacebook,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      AppStrings.dontHaveAccount,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        print('Sign Up is Clicked');
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.amber,
                      ),
                      child: Text(
                        AppStrings.signUp,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> doLogin() async {
    final username = usernameController.text;
    final password = passwordController.text;
    final body = {
      'username': username,
      'password': password,
    };
    final response = await http.post(
      Uri.parse(loginRoute),
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    } else {
      print('Login Failed');
      throw Exception('Error');
    }
  }
}
