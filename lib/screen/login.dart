import 'package:chaty/widget/text_in_put_fileds.dart';
import 'package:chaty/widget/btn.dart';
import 'package:chaty/widget/richTextLibe.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

const primary = Color(0xff2b475e);

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = GlobalKey();

  bool isloading = false;

  String? email;

  String? password;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: const SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          )),
      color: Colors.black,
      blur: 1,
      opacity: .2,
      inAsyncCall: isloading,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          color: primary,
          child: ListView(
            children: [
              const Spacer(
                flex: 4,
              ),
              SvgPicture.asset(
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
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
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Textinputfileds(
                              onchanged: (date) {
                                email = date;
                              },
                              validator: (date) {
                                if (date!.isEmpty || date == "") {
                                  return "value is wrong";
                                }
                              },
                              hint: "enter your email",
                              label: "email",
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Textinputfileds(
                              onchanged: (date) {
                                password = date;
                              },
                              validator: (date) {
                                if (date!.isEmpty || date == "") {
                                  return "value is wrong";
                                }
                              },
                              hint: "entre your password",
                              label: "password",
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 23,
                  ),
                  customBtn(
                    ontap: () async {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          isloading = true;
                        });

                        try {
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: email!, password: password!);

                          // Sign-in was successful
                          setState(() {
                            isloading = false;
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.green.shade100,
                              content: const Text(
                                "You have signed in successfully",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );

                          Navigator.pushNamed(context, "welcome");
                        } on FirebaseAuthException catch (e) {
                          setState(() {
                            isloading = false;
                          });

                          if (e.code == "user-not-found") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red.shade100,
                                content: const Text(
                                  "No user found for that email.",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          } else if (e.code == 'wrong-password') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red.shade100,
                                content: const Text(
                                  "Wrong password provided for that user.",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red.shade100,
                                content: Text(
                                  "your email or password is not correct",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          }
                        }
                      }
                    },
                    textBtn: "Log in",
                  ),
                  richTextSIgnUP(
                    navigate: () => Navigator.pushNamed(context, "signup"),
                    fullText: " you dont have account ?  ",
                    text: "sign Up",
                  )
                ],
              ),
              const Spacer(
                flex: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
