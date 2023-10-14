import 'package:flutter/material.dart';
import 'package:flutter_learning/models/chat_message_entity.dart';
import 'package:flutter_learning/widgets/bottomSheet_image.dart';
// ignore_for_file: file_names

// ignore_for_file: avoid_print

class ChatInput extends StatefulWidget {
  final Function(ChatMessageEntity) onSubmit;

  const ChatInput({super.key, required this.onSubmit});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  String _selectedImagedUrl = "";

  final chatMessageController = TextEditingController();

  void sendMessage() {
    final newChatMessage = ChatMessageEntity(
      message: chatMessageController.text,
      id: "132",
      createdAt: DateTime.now().millisecondsSinceEpoch,
      author: Author(username: "Thulasi Dass"),
    );
    if (_selectedImagedUrl.isNotEmpty) {
      newChatMessage.imageUrl = _selectedImagedUrl;
    }
    widget.onSubmit(newChatMessage);

    chatMessageController.clear();
    _selectedImagedUrl = "";
  }

  void imagePicked(String newImageUrl) {
    setState(() {
      _selectedImagedUrl = newImageUrl;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      // padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 2),
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return NetworkImagePicker(onSelectedImage: imagePicked);
                  });
            },
            icon: const Icon(Icons.add),
            color: Colors.white,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                minLines: 1,
                textCapitalization: TextCapitalization.sentences,
                controller: chatMessageController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Type your message',
                  hintStyle: TextStyle(color: Colors.cyan),
                  border: InputBorder.none,
                ),
              ),
              if (_selectedImagedUrl.isNotEmpty)
                Image.network(
                  _selectedImagedUrl,
                  height: 50,
                ),
            ],
          )),
          IconButton(
            onPressed: () {
              sendMessage();
            },
            icon: const Icon(Icons.send),
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
