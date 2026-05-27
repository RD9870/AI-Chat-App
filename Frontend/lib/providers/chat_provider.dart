import 'package:ai_chat_app/providers/base_provider.dart';
import 'package:flutter/cupertino.dart';

class ChatProvider extends BaseProvider {
  void sendMessage(String message) {
    debugPrint(message);
  }
}
