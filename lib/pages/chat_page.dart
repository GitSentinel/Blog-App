import 'package:create_app/components/toolbar.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(title: 'Chat'),
      body: ListView.builder(
        itemBuilder: (context, index) {},
      ),
    );
  }
}
