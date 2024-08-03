import 'package:chaty/screen/login.dart';
import 'package:chaty/widget/TextInPutFileds.dart';
import 'package:chaty/widget/btn.dart';
import 'package:chaty/widget/richTextLibe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class signUp extends StatelessWidget {
  const signUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: primary,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SvgPicture.asset(
                colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),
                "assets/f1d84b87-c3aa-4d53-ad5e-c14c1c7e385b.svg",
                width: 200.0, // Optional: specify width
                height: 200.0, // Optional: specify height
                placeholderBuilder: (BuildContext context) => Container(
                    padding: const EdgeInsets.all(30.0),
                    child: const CircularProgressIndicator()),
              ),
              Text("Get start",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  )),
              Textinputfileds(),
              SizedBox(
                height: 12,
              ),
              Textinputfileds(),
              SizedBox(
                height: 12,
              ),
              customBtn(
                TextBtn: "Sign UP",
              ),
              SizedBox(
                height: 10,
              ),
              richTextSIgnUP(
                navigate: () => Navigator.pop(context),
                fullText: "You have account ",
                text: "sign In ",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
