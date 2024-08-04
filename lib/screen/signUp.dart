import 'dart:ffi';

import 'package:chaty/screen/login.dart';
import 'package:chaty/widget/TextInPutFileds.dart';
import 'package:chaty/widget/btn.dart';
import 'package:chaty/widget/richTextLibe.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class signUp extends StatelessWidget {
  signUp({super.key});
  String? email;
  String? Paassword;

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
              Textinputfileds(
                onchanged: (data) {
                  email = data;
                },
              ),
              SizedBox(
                height: 12,
              ),
              Textinputfileds(
                onchanged: (data) {
                  Paassword = data;
                },
              ),
              SizedBox(
                height: 12,
              ),
              customBtn(
                ontap: () async {
                  try {
                    await registerUser();
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      handleWeakPasswordError(context);
                    } else if (e.code == 'email-already-in-use') {
                      alreadyExistEmal(context);
                    }
                  }
                  signComplete(context);
                },
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

  void signComplete(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green.shade100,
        content: Text(
          "you have registered successfully",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  void alreadyExistEmal(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red.shade100,
        content: Text(
          "this already exist",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  void handleWeakPasswordError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red.shade100,
        content: Text(
          "entre strong password",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Future<UserCredential> registerUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email!, password: Paassword!);
    return user;
  }
}
