import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class richTextSIgnUP extends StatelessWidget {
  const richTextSIgnUP({
    super.key,
    required this.text,
    required this.fullText,
    required this.navigate,
  });
  final String text;
  final String fullText;

  final Function navigate;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
          text: TextSpan(
              style: TextStyle(color: Colors.white),
              children: <TextSpan>[
            TextSpan(text: fullText, style: TextStyle(fontSize: 20)),
            TextSpan(
                text: text,
                style: TextStyle(color: Colors.green, fontSize: 18),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    return navigate();
                  })
          ])),
    );
  }
}
