import 'package:flutter/material.dart';
import 'package:flutter_application_8/models/messages.dart';

class Chatbuble extends StatelessWidget {
  Chatbuble({
    super.key,
    required this.messages,
  });
  final Messages messages;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(32))),
        child: Text(
          messages.message,
          style: const TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}

class ChatbubleReceiver extends StatelessWidget {
  ChatbubleReceiver({
    super.key,
    required this.messages,
  });
  final Messages messages;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomLeft: Radius.circular(32))),
        child: Text(
          messages.message,
          style: const TextStyle(color: Colors.orange),
        ),
      ),
    );
  }
}
