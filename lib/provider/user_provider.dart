import 'package:create_app/data/model/user.dart';
import 'package:create_app/data/service/get_all_user_service.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  Future<List<User>> getAllUser() async {
    return await GetAllUserService().call();
  }
}
