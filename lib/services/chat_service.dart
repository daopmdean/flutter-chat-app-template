import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_flutter_chat_app_template/widgets/message_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ChatService {
  static final _fireStore = FirebaseFirestore.instance;
  static final _auth = FirebaseAuth.instance;

  static String get currentUser => _auth.currentUser.email;

  static Future<void> sendMessage(
    TextEditingController messageTextController,
  ) async {
    // Todo 3: Implements sendMessage()
  }

  static Stream<QuerySnapshot> getQuerySnapshot() {
    // Todo 4: Implements getQuerySnapshot()
    return null;
  }

  static List<MessageBubble> getMessageBubbles(
    Iterable<DocumentSnapshot> messages,
    String currentUser,
  ) {
    // Todo 5: Implements getMessageBubbles()
    return null;
  }
}
