import 'package:ai_chat_app/providers/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserTextField extends StatefulWidget {
  const UserTextField({super.key});

  @override
  State<UserTextField> createState() => _UserTextFieldState();
}

class _UserTextFieldState extends State<UserTextField> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, chatConsumer, _) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            onFieldSubmitted: (value) {
              if (controller.text.isEmpty) return;
              chatConsumer.sendMessage(controller.text.trim());
              controller.clear();
            },
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  if (controller.text.isEmpty) return;
                  // chatConsumer.sendMessage(controller.text.trim());
                  debugPrint(controller.text.trim());
                },
                icon: Icon(Icons.send),
              ),
              hintText: "Type your message here........",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32)),
              ),
            ),
          ),
        );
      },
    );
  }
}
