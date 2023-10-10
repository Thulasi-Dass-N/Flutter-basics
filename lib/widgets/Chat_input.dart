import 'package:flutter/material.dart';
// ignore_for_file: file_names

// ignore_for_file: avoid_print


class ChatInput extends StatelessWidget {
  ChatInput({super.key});

  final chatMessageController = TextEditingController();

  void sendMessage() {
    print(chatMessageController.text);
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
            onPressed: () {},
            icon: const Icon(Icons.add),
            color: Colors.white,
          ),
          Expanded(
              child: TextField(
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
