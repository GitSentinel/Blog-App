// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:create_app/components/post_item.dart';
import 'package:create_app/components/toolbar.dart';
import 'package:create_app/config/app_icons.dart';
import 'package:create_app/config/app_routes.dart';
import 'package:create_app/config/app_strings.dart';
import 'package:create_app/provider/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<PostProvider>().getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(
        title: AppStrings.appName,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.nearby);
            },
            icon: SvgPicture.asset(AppIcons.location),
          ),
        ],
      ),
      body: Consumer<PostProvider>(
        builder: (context, value, child) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return PostItem(
                post: value.list[index],
              );
            },
            itemCount: value.list.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 20,
              );
            },
          );
        },
      ),
    );
  }
}
