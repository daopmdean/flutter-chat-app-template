import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dsc_flutter_chat_app_template/screens/chat_screen.dart';
import 'package:dsc_flutter_chat_app_template/widgets/auth_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'Welcome_Screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

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
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('assets/images/dsc_logo.png'),
                    height: 65,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['DSC chat'],
                  textStyle: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            AuthButton(
              image: AssetImage('assets/images/google_logo.png'),
              color: Colors.redAccent,
              text: 'Sign in with Google',
              onPressed: () {
                Navigator.pushNamed(context, ChatScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
