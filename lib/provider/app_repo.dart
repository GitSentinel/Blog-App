import 'package:create_app/data/model/user.dart';
import 'package:flutter/material.dart';

class AppRepo extends ChangeNotifier {
  String? _token;
  User? user;

  set token(String? value) {
    _token = value;
  }

  String? get token => _token;
}
