import 'package:flutter/material.dart';
import 'package:flutter_learning/models/chat_message_entity.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessageEntity entity;

  final Alignment alignment;

  const ChatBubble({super.key, required this.alignment, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.grey,
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
          children: [
            Text(
              entity.message,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            if (entity.imageUrl != null)
              Image.network(
                entity.imageUrl!,
                height: 200,
              ),
          ],
        ),
      ),
    );
  }
}
