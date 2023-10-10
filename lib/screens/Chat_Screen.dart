import 'package:flutter/material.dart';
import 'package:flutter_learning/widgets/Chat_bubble.dart';
import 'package:flutter_learning/widgets/Chat_input.dart';
// ignore_for_file: file_names

class ChatScreen extends StatelessWidget {
  // final String username;

  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
                // Navigator.pop(context);
              },
              icon: const Icon(Icons.logout),
              color: Colors.black,
            )
          ],
          title: Text(
            "I'm $username",
            style: const TextStyle(color: Colors.black),
          ),
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ChatBubble(
                      alignment: index % 2 == 0
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      message: "Hi there how are you");
                },
              ),
            ),
            ChatInput(),
          ],
        ),
      ),
    );
  }
}
