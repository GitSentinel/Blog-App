// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';

import 'package:create_app/components/app_text_field.dart';
import 'package:create_app/provider/app_repo.dart';
import 'package:create_app/provider/post_provider.dart';
import 'package:create_app/styles/app_colors.dart';
import 'package:create_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class NewPostModel extends StatelessWidget {
  const NewPostModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Insert Message',
            style: AppText.header1,
          ),
          SizedBox(
            height: 16,
          ),
          AppTextField(
            hint: 'Message ...',
            onChange: (value) {
              context.read<PostProvider>().message = value;
            },
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Insert Image',
            style: AppText.header1,
          ),
          SizedBox(
            height: 16,
          ),
          Consumer<PostProvider>(
              builder: (context, value, child) => GestureDetector(
                    onTap: () {
                      context
                          .read<PostProvider>()
                          .pickImage(ImageSource.gallery);
                    },
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: value.imagePath == null
                          ? Center(
                              child: Text('Upload from Gallery'),
                            )
                          : ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              child: Stack(
                                children: [
                                  Image.file(
                                    File(value.imagePath!),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        value.deleteImage();
                                      },
                                      icon: Icon(
                                        Icons.delete_rounded,
                                        color: Colors.red,
                                      ))
                                ],
                              ),
                            ),
                    ),
                  )),
          SizedBox(
            height: 16,
          ),
          Text("OR"),
          SizedBox(
            height: 16,
          ),
          OutlinedButton(
            onPressed: () {},
            child: Text('Camera'),
          ),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () {
              context
                  .read<PostProvider>()
                  .createPost(context.read<AppRepo>().token!)
                  .then((value) {
                Navigator.of(context).pop();
              });
            },
            child: Text('Create Post'),
          ),
        ],
      ),
    );
  }
}
