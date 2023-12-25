import 'dart:convert';

import 'package:create_app/data/model/chat.dart';
import 'package:create_app/data/model/user.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class AppRepo extends ChangeNotifier {
  String? _token;
  User? user;
  WebSocketChannel? _channel;
  List<Chat> chats = [];

  set token(String? value) {
    _token = value;
    _connectSocket();
  }

  String? get token => _token;

  _connectSocket() {
    final wsUrl = Uri.parse('ws://localhost:8080/ws?token = $_token');
    _channel = WebSocketChannel.connect(wsUrl);
    _channel?.stream.listen((message) {
      chats.add(Chat.fromJson(jsonDecode(message)));
      notifyListeners();
    });
  }
}
