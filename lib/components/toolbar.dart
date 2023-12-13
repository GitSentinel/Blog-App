import 'package:create_app/styles/app_colors.dart';
import 'package:create_app/styles/app_text.dart';
import 'package:flutter/material.dart';

class Toolbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  const Toolbar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.font,
      centerTitle: false,
      title: Text(
        title,
        style: AppText.header1,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
