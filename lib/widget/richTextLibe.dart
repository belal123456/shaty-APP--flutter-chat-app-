import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class richTextSIgnUP extends StatelessWidget {
  const richTextSIgnUP({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
          text: TextSpan(
              style: TextStyle(color: Colors.white),
              children: <TextSpan>[
            TextSpan(
                text: " you dont have account ?  ",
                style: TextStyle(fontSize: 20)),
            TextSpan(
                text: "signUp",
                style: TextStyle(color: Colors.green, fontSize: 18),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print('Terms of Service"');
                  })
          ])),
    );
  }
}
