import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kTextFieldInputDecoration = InputDecoration(
  hintText: 'Hint Text Here',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: kPrimaryOutlineInputBorder,
  enabledBorder: kEnabledOutlineInputBorder,
  focusedBorder: kFocusedOutlineInputBorder,
);

const kPrimaryOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(32.0)),
);

const kEnabledOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
  borderRadius: BorderRadius.all(Radius.circular(32.0)),
);

const kFocusedOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  borderRadius: BorderRadius.all(Radius.circular(32.0)),
);

const kIsMeBorderRadius = BorderRadius.only(
  topLeft: Radius.circular(25),
  bottomLeft: Radius.circular(25),
  bottomRight: Radius.circular(25),
);

const kIsNotMeBorderRadius = BorderRadius.only(
  topRight: Radius.circular(25),
  bottomLeft: Radius.circular(25),
  bottomRight: Radius.circular(25),
);
