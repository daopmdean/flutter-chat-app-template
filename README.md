# dsc_flutter_chat_app_template

A DSC template Flutter application.

## Getting Started

This project is a starting point for a Flutter application with Firebase.

A few resources to get you started if this is your first Flutter project:

- [Dart basics](https://dart.dev/guides/language/language-tour)
- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Lab: Sign in with google](https://blog.codemagic.io/firebase-authentication-google-sign-in-using-flutter/)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Now let's get started.

## Firebase setup

### Android

### iOS

## Coding time

// ToDo 1: Implements signInWithGoogle()

```dart
static Future<User> signInWithGoogle() async {
  final googleSignInAccount = await _googleSignIn.signIn();

  if (googleSignInAccount == null) {
    return null;
  }

  final googleSignInAuthentication = await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential result = await _auth.signInWithCredential(credential);

  return result.user;
}
```

// ToDo 2: Implements signOutGoogle()

```dart
static Future<void> signOutGoogle() async {
  await _auth.signOut();
  await _googleSignIn.signOut();
}
```

// Todo 3: Implements sendMessage()

```dart
static Future<void> sendMessage(
  TextEditingController messageTextController,
) async {
  if (messageTextController.text.trim().isNotEmpty) {
    await _fireStore.collection("messages").add({
      'message': messageTextController.text,
      'sender': _auth.currentUser.email,
      'created': Timestamp.now(),
    });
  }
  messageTextController.clear();
}
```

// Todo 4: Implements getQuerySnapshot()

```dart
static Stream<QuerySnapshot> getQuerySnapshot() {
  return _fireStore.collection("messages").orderBy("created").snapshots();
}
```

// Todo 5: Implements getMessageBubbles()

```dart
static List<MessageBubble> getMessageBubbles(
  Iterable<DocumentSnapshot> messages,
  String currentUser,
) {
  List<MessageBubble> messageBubbles = [];

  for (var message in messages) {
    var messageText = message.data()['message'];
    var sender = message.data()['sender'];
    var created = message.data()['created'];

    var messageBubble = MessageBubble(
      text: messageText,
      sender: sender,
      created: created,
      isMe: currentUser == sender,
    );
    messageBubbles.add(messageBubble);
  }

  return messageBubbles;
}
```
