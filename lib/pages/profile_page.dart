// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:create_app/components/toolbar.dart';
import 'package:create_app/components/user_avatar.dart';
import 'package:create_app/config/app_routes.dart';
import 'package:create_app/config/app_strings.dart';
import 'package:create_app/styles/app_text.dart';
import 'package:flutter/material.dart';

enum ProfileMenu { editProfile, logOut }

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(
        title: AppStrings.profile,
        actions: [
          PopupMenuButton<ProfileMenu>(
            onSelected: (value) {
              switch (value) {
                case ProfileMenu.editProfile:
                  Navigator.of(context).pushNamed(AppRoutes.editProfile);
                  break;
                case ProfileMenu.logOut:
                  print('Log Out');
                  break;
              }
            },
            icon: Icon(Icons.more_vert_rounded),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.edit),
                      SizedBox(
                        width: 8,
                      ),
                      Text(AppStrings.editProfile),
                    ],
                  ),
                  value: ProfileMenu.editProfile,
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.logout),
                      SizedBox(
                        width: 8,
                      ),
                      Text(AppStrings.logOut),
                    ],
                  ),
                  value: ProfileMenu.logOut,
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          UserAvatar(
            size: 90,
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            'Oliver Cristofer',
            style: AppText.header2,
          ),
          Text(
            'India',
            style: AppText.subtitle3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    '575',
                    style: AppText.header2,
                  ),
                  Text(
                    AppStrings.followers,
                    style: AppText.subtitle2,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '85',
                    style: AppText.header2,
                  ),
                  Text(
                    AppStrings.posts,
                    style: AppText.subtitle2,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '345',
                    style: AppText.header2,
                  ),
                  Text(
                    AppStrings.following,
                    style: AppText.subtitle2,
                  ),
                ],
              ),
            ],
          ),
          Divider(
            thickness: 1,
            height: 24,
          ),
        ],
      ),
    );
  }
}
