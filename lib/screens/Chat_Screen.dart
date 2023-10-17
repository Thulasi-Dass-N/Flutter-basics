import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learning/models/chat_message_entity.dart';
import 'package:flutter_learning/services/auth_service.dart';
import 'package:flutter_learning/widgets/Chat_bubble.dart';
import 'package:flutter_learning/widgets/Chat_input.dart';

import 'package:provider/provider.dart';
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

    final List<ChatMessageEntity> chatMessages = decodeMessage.map((listItem) {
      return ChatMessageEntity.fromJson(listItem);
    }).toList();
    setState(() {
      _messageList = chatMessages;
    });
    // print(_chatMessages.length);
  }

  onMessageSent(ChatMessageEntity entity) {
    // print(entity.message);
    _messageList.add(entity);
    setState(() {});
  }

  // final ImageRepository _imageRepo = ImageRepository();

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
  // Future<List<BottomSheetEntity>> _getNetworkImage() async {
  //   var endpointUrl = Uri.parse('https://dummyjson.com/products');
  //   final response = await http.get(endpointUrl);

  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> jsonData = json.decode(response.body);
  //     BottomSheetEntity productList = BottomSheetEntity.fromJson(jsonData);


  //     print("Total products: ${productList.products.length}");
  //     print("First product title: ${productList.products[0].title}");
  //     print("Total items in the list: ${productList.total}");
  //   } else {
  //     throw Exception("API ERROR");
  //   }
  //   throw Exception("error12434534");
  // }

  @override
  void initState() {
    _loadMessage();
    // _getNetworkImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final username = ModalRoute.of(context)!.settings.arguments as String;
    final username = context.watch<AuthService>().getUsername();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {
                context.read<AuthService>().updateUsername("Thulasi Dass N");
              },
              icon: const Icon(Icons.change_circle_rounded),
              color: Colors.black,
            ),
            IconButton(
              onPressed: () {
                context.read<AuthService>().logoutUser();
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
                  return Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ChatBubble(
                      alignment: _messageList[index].author.username ==
                          context.read<AuthService>().getUsername()
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
                    ),
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
