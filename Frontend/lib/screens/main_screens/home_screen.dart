import 'package:flutter/material.dart';
import 'package:ai_chat_app/widgets/inputs/text_field.dart';

import 'package:ai_chat_app/widgets/statics/chat_bubble.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Chat History",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    // TODO Make the chat history list dynamic
                    ListTile(
                      leading: Icon(Icons.chat),
                      title: Text('Chat'),
                      onTap: () {
                        // TODO add navigation to chat screen
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.chat),
                      title: Text('Chat'),
                      onTap: () {
                        // TODO add navigation to chat screen
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.chat),
                      title: Text('Chat'),
                      onTap: () {
                        // TODO add navigation to chat screen
                      },
                    ),
                  ],
                ),
              ),

              Divider(),
              ListTile(
                leading: Icon(Icons.restart_alt),
                title: Text('Reset App'),
                onTap: () {
                  // TODO add navigation to settings screen
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                physics: AlwaysScrollableScrollPhysics(),
                children: [
                  // TODO Make the chat messages list dynamic
                  ChatBubble(
                    isUser: true,
                    text:
                        "Velit ad occaecat aute qui adipisicing sit ex ipsum magna tempor pariatur.",
                  ),

                  ChatBubble(
                    isUser: false,
                    text:
                        "Dolor duis eu consectetur commodo quis reprehenderit cupidatat sit non aliqua. Duis voluptate veniam consequat labo ",
                  ),
                  ChatBubble(
                    isUser: true,
                    text:
                        "Consectetur consectetur officia occaecat Lorem ea aliqua id duis excepteur officia ex est ea.",
                  ),
                ],
              ),
            ),
            UserTextField(),

            // Padding(padding: const EdgeInsets.all(8.0), child: UserTextField()),
          ],
        ),
      ),
    );
  }
}
