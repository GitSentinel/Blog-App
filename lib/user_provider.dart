import 'package:create_app/model/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends InheritedWidget {
  final Widget child;
  final User user;
  const UserProvider({
    required this.user,
    super.key,
    required this.child,
  }) : super(child: child);

  static User? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProvider>()?.user;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    throw UnimplementedError();
  }
}
