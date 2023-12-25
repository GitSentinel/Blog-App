// ignore_for_file: prefer_const_constructors

import 'package:create_app/components/user_avatar.dart';
import 'package:create_app/data/model/chat.dart';
import 'package:create_app/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ChatMeItem extends StatelessWidget {
  final Chat chat;
  const ChatMeItem({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
        top: 8,
        left: 30,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                child: Text(
                  chat.message,
                  style: TextStyle(
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          UserAvatar(),
        ],
      ),
    );
  }
}
