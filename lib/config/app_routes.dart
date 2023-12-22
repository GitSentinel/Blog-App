import 'package:create_app/model/user.dart';
import 'package:create_app/pages/edit_profile_page.dart';
import 'package:create_app/pages/home_page.dart';
import 'package:create_app/pages/login_page.dart';
import 'package:create_app/pages/main_page.dart';
import 'package:create_app/pages/nearby_page.dart';

class AppRoutes {
  static final pages = {
    login: (context) => LoginPage(),
    home: (context) => HomePage(),
    main: (context) => MainPage(
          user: User(
            1,
            'firstname',
            'lastname',
            'mobile',
            'birthday',
            'gender',
            false,
          ),
        ),
    editProfile: (context) => EditProfilePage(),
    nearby: (context) => NearbyPage(),
  };

  static const login = '/';
  static const home = '/home';
  static const main = '/main';
  static const editProfile = '/edit-profile';
  static const nearby = '/nearby';
}
