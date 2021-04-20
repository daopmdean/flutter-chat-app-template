import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_flutter_chat_app_template/constants.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    @required this.text,
    @required this.sender,
    @required this.created,
    @required this.isMe,
  });

  final String text;
  final String sender;
  final Timestamp created;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          Material(
            elevation: 5,
            borderRadius: isMe ? kIsMeBorderRadius : kIsNotMeBorderRadius,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 15,
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Text(
            created.toDate().toString(),
            style: TextStyle(
              fontSize: 8,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
