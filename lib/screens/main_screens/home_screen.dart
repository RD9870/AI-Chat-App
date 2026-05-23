import 'package:flutter/material.dart';
import 'package:v_wallet_frontend/widgets/statics/chat_bubble.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              child: ListView(
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
              children: [
                // TODO Make the chat messages list dynamic
                ChatBubble(isUser: true),
                ChatBubble(isUser: false),
                ChatBubble(isUser: true),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Type your message here........",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
