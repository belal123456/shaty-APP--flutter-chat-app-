import 'package:chaty/screen/signUp.dart';
import 'package:chaty/widget/TextInPutFileds.dart';
import 'package:chaty/widget/btn.dart';
import 'package:chaty/widget/richTextLibe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

const primary = Color(0xff2b475e);

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: primary,
        child: Column(
          children: [
            const Spacer(
              flex: 3,
            ),
            SvgPicture.asset(
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              "assets/f88adbb5-327d-4afa-969b-952f878302c0.svg",
              width: 100.0, // Optional: specify width
              height: 100.0, // Optional: specify height
              placeholderBuilder: (BuildContext context) => Container(
                  padding: const EdgeInsets.all(30.0),
                  child: const CircularProgressIndicator()),
            ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              "chat with your friends & more",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Textinputfileds(),
                ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Textinputfileds(),
                ),
                SizedBox(
                  height: 23,
                ),
                customBtn(
                  TextBtn: "Log in",
                ),
                richTextSIgnUP(
                  navigate: () => Navigator.pushNamed(context, "signup"),
                  fullText: " you dont have account ?  ",
                  text: "sign Up",
                )
              ],
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
