import 'package:create_app/pages/edit_profile_page.dart';
import 'package:create_app/pages/home_page.dart';
import 'package:create_app/pages/login_page.dart';
import 'package:create_app/pages/main_page.dart';

class AppRoutes {
  static final pages = {
    '/': (context) => LoginPage(),
    '/home': (context) => HomePage(),
    '/main': (context) => MainPage(),
    '/edit-profile': (context) => EditProfilePage(),
  };

  static const login = '/';
  static const home = '/home';
  static const main = '/main';
  static const editProfile = '/edit-profile';
}
