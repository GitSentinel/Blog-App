// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:create_app/components/app_text_field.dart';
import 'package:create_app/components/toolbar.dart';
import 'package:create_app/config/app_strings.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(
        title: AppStrings.editProfile,
      ),
      body: Column(
        children: [
          AppTextField(hint: AppStrings.firstName),
          AppTextField(hint: AppStrings.lastName),
          AppTextField(hint: AppStrings.phoneNumber),
          AppTextField(hint: AppStrings.location),
        ],
      ),
    );
  }
}
