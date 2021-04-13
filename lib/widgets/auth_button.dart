import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    @required this.color,
    @required this.onPressed,
    @required this.text,
    this.image,
  });

  final Color color;
  final Function onPressed;
  final String text;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 52.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (image != null)
                Image(
                  image: image,
                  height: 35.0,
                ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
