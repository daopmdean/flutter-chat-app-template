import 'package:dsc_flutter_chat_app_template/constants.dart';
import 'package:dsc_flutter_chat_app_template/services/chat_service.dart';
import 'package:dsc_flutter_chat_app_template/services/sign_in_with_google.dart';
import 'package:dsc_flutter_chat_app_template/widgets/message_stream.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static const id = '/Chat_Screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () async {
                await Authentication.signOutGoogle();
                Navigator.pop(context);
              }),
        ],
        title: Text('DSC ️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(
              stream: ChatService.getQuerySnapshot(),
              currentUser: ChatService.currentUser,
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                    onPressed: () async {
                      await ChatService.sendMessage(messageTextController);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
