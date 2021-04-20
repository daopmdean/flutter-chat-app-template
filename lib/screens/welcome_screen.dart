import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dsc_flutter_chat_app_template/constants.dart';
import 'package:dsc_flutter_chat_app_template/screens/chat_screen.dart';
import 'package:dsc_flutter_chat_app_template/services/sign_in_with_google.dart';
import 'package:dsc_flutter_chat_app_template/widgets/auth_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = '/Welcome_Screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  bool showSpinner = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animation = ColorTween(
      begin: Colors.blueGrey,
      end: Colors.white,
    ).animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Image.asset('assets/images/dsc_logo.png'),
                height: 100,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'DSC FPTU HCM',
                      textStyle: kAnimatedTextStyle,
                    ),
                    TypewriterAnimatedText(
                      'Chat App',
                      textStyle: kAnimatedTextStyle,
                    ),
                    TypewriterAnimatedText(
                      'Flutter',
                      textStyle: kAnimatedTextStyle,
                    ),
                    TypewriterAnimatedText(
                      'Firebase',
                      textStyle: kAnimatedTextStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              AuthButton(
                image: AssetImage('assets/images/google_logo.png'),
                color: Colors.redAccent,
                text: 'Sign in with Google',
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  User user = await Authentication.signInWithGoogle();
                  setState(() {
                    showSpinner = false;
                  });
                  if (user != null) {
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
