import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_flutter_chat_app_template/services/chat_service.dart';
import 'package:dsc_flutter_chat_app_template/widgets/message_bubble.dart';
import 'package:flutter/material.dart';

class MessageStream extends StatelessWidget {
  final Stream<QuerySnapshot> stream;
  final String currentUser;

  const MessageStream({
    Key key,
    @required this.stream,
    @required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Text('No message yet'),
          );
        }

        final messages = snapshot.data.docs.reversed;
        List<MessageBubble> messageBubbles =
            ChatService.getMessageBubbles(messages, currentUser);

        return Expanded(
          child: ListView(
            reverse: true,
            children: messageBubbles,
          ),
        );
      },
    );
  }
}
