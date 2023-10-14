import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learning/models/chat_message_entity.dart';
import 'package:flutter_learning/repo/image_repository.dart';
import 'package:flutter_learning/widgets/Chat_bubble.dart';
import 'package:flutter_learning/widgets/Chat_input.dart';

// ignore_for_file: file_names

class ChatScreen extends StatefulWidget {
  // final String username;
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessageEntity> _messageList = [];

  _loadMessage() async {
    final response = await rootBundle.loadString('assets/mock_message.json');

    final List<dynamic> decodeMessage = jsonDecode(response) as List;

    final List<ChatMessageEntity> _chatMessages = decodeMessage.map((listItem) {
      return ChatMessageEntity.fromJson(listItem);
    }).toList();
    setState(() {
      _messageList = _chatMessages;
    });
    // print(_chatMessages.length);
  }

  onMessageSent(ChatMessageEntity entity) {
    // print(entity.message);
    _messageList.add(entity);
    setState(() {});
  }

  final ImageRepository _imageRepo = ImageRepository();

  // Future<List<ImageModel>> _getNetworkImage() async {
  //   var endpointUrl = Uri.parse('https://jsonplaceholder.typicode.com/photos');
  //   final response = await http.get(endpointUrl);
  //
  //   if (response.statusCode == 200) {
  //     final List<dynamic> decodeMessage = jsonDecode(response.body) as List;
  //     // final Map<String, dynamic> decodeMessage = jsonDecode(response.body);
  //
  //     final List<ImageModel> _images = decodeMessage.map((listItem) {
  //       return ImageModel.fromJson(listItem);
  //     }).toList();
  //     return _images;
  //     print(_images[0].thumbnail);
  //   } else {
  //     throw Exception("API ERROR");
  //   }
  // }

  @override
  void initState() {
    _loadMessage();
    // _getNetworkImage();
    super.initState();
  }

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
                itemCount: _messageList.length,
                itemBuilder: (context, index) {
                  return ChatBubble(
                    alignment:
                        _messageList[index].author.username == 'Thulasi Dass N'
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                    entity: _messageList[index],
                    // ChatMessageEntity(
                    //   id: '12',
                    //   message:
                    //       index % 2 == 0 ? "Hi there how are you" : " I'm fine",
                    //   createdAt: DateTime.now().millisecondsSinceEpoch,
                    //   author: Author(username: "Thulasi Dass N"),
                    // ),
                    // message: "Hi there how are you"
                  );
                },
              ),
            ),
            ChatInput(onSubmit: onMessageSent),
          ],
        ),
      ),
    );
  }
}
