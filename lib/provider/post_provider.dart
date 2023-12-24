import 'package:create_app/data/model/post.dart';
import 'package:create_app/data/service/create_post_service.dart';
import 'package:create_app/data/service/get_post_service.dart';
import 'package:create_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostProvider extends ChangeNotifier {
  final List<Post> list = [];
  String message = '';
  String? imagePath;
  getPost() async {
    list.clear();
    list.addAll(await GetPostService().call());
    notifyListeners();
  }

  Future<void> createPost(String token) async {
    await CreatePostService(message, null, token).call();
    message = '';
    getPost();
  }

  pickImage(ImageSource source) async {
    try {
      final path = await Utils.pickImage(source);
      imagePath = path;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
