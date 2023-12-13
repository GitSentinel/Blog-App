// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:create_app/components/app_text_field.dart';
import 'package:create_app/components/toolbar.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(
        title: 'Edit Profile',
      ),
      body: Column(
        children: [
          AppTextField(hint: 'First Name'),
          AppTextField(hint: 'Last Name'),
          AppTextField(hint: 'Phone Number'),
          AppTextField(hint: 'Location'),
        ],
      ),
    );
  }
}
