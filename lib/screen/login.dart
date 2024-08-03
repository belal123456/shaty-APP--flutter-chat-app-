import 'package:chaty/widget/TextInPutFileds.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.blueGrey.withOpacity(.5),
      child: const Column(
        children: [
          Spacer(
            flex: 3,
          ),
          Image(image: AssetImage("assets/cloudy.png")),
          Spacer(),
          Text(
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
                height: 23,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Textinputfileds(),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Textinputfileds(),
              )
            ],
          ),
          Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
