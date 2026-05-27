import 'package:flutter/material.dart';
import 'package:ai_chat_app/helpers/consts.dart';

class ChatBubble extends StatefulWidget {
  final bool isUser;
  final String text;
  const ChatBubble({super.key, required this.isUser, required this.text});

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: widget.isUser
              ? userBubleBackgroundColor
              : reciverBubleBackgroundColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: bubleBorderColor),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: widget.isUser ? userBubleTextColor : reciverBubleTextColor,
          ),
        ),
      ),
    );
  }
}
