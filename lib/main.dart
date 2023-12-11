import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Column(
          children: [
            Text('Hello, Welcome Back'),
            Text('Login to Continue'),
            Text('New Text'),
            Text('Its a text after stateless widget'),
          ],
        ),
      ),
    );
  }
}
