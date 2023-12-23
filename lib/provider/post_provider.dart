import 'package:create_app/data/model/post.dart';
import 'package:create_app/data/service/get_post_service.dart';
import 'package:flutter/material.dart';

class PostProvider extends ChangeNotifier {
  final List<Post> list = [];
  getPost() async {
    list.clear();
    list.addAll(await GetPostService().call());
    notifyListeners();
  }
}
