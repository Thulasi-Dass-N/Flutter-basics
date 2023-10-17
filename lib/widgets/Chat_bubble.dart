import 'package:flutter/material.dart';
import 'package:flutter_learning/models/chat_message_entity.dart';
import 'package:flutter_learning/services/auth_service.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessageEntity entity;

  final Alignment alignment;

  const ChatBubble({super.key, required this.alignment, required this.entity});

  @override
  Widget build(BuildContext context) {
    bool isAuthor =
        entity.author.username == context.watch<AuthService>().getUsername();
    return Align(
      alignment: alignment,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        padding: const EdgeInsets.all(10),
        // margin: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: isAuthor ? Theme.of(context).primaryColor : Colors.black87,
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12),
              topRight: const Radius.circular(12),
              bottomLeft: alignment == Alignment.centerRight
                  ? const Radius.circular(12)
                  : const Radius.circular(0),
              bottomRight: alignment == Alignment.centerLeft
                  ? const Radius.circular(12)
                  : const Radius.circular(0)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                entity.message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            if (entity.imageUrl != null)
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(entity.imageUrl!),
                      fit: BoxFit.fitWidth),
                  borderRadius: BorderRadius.circular(12),
                ),
                // child: Image.network(
                //   entity.imageUrl!,
                //   height: 200,
                // ),
              ),
          ],
        ),
      ),
    );
  }
}
