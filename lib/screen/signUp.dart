import 'package:chaty/screen/login.dart';
import 'package:chaty/widget/text_in_put_fileds.dart';
import 'package:chaty/widget/btn.dart';
import 'package:chaty/widget/richTextLibe.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class signUp extends StatefulWidget {
  signUp({
    super.key,
  });

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final GlobalKey<FormState> formKey = GlobalKey();

  String? email;

  String? paassword;

  bool isloadin = false;

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
      inAsyncCall: isloadin,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          color: primary,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                SvgPicture.asset(
                  colorFilter:
                      const ColorFilter.mode(Colors.green, BlendMode.srcIn),
                  "assets/f1d84b87-c3aa-4d53-ad5e-c14c1c7e385b.svg",
                  width: 200.0, // Optional: specify width
                  height: 200.0, // Optional: specify height
                  placeholderBuilder: (BuildContext context) => Container(
                      padding: const EdgeInsets.all(30.0),
                      child: const CircularProgressIndicator()),
                ),
                const Text("Get start",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    )),
                const SizedBox(
                  height: 12,
                ),
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Textinputfileds(
                          hint: "enter your email",
                          label: "email",
                          validator: (data) {
                            if (data!.isEmpty || data == "") {
                              return "value is wrong";
                            }
                            return null;
                          },
                          onchanged: (data) {
                            email = data;
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Textinputfileds(
                          hint: "entre your password",
                          label: "password",
                          validator: (data) {
                            if (data!.isEmpty || data == "") {
                              return "value is wrong";
                            }
                            return null;
                          },
                          onchanged: (data) {
                            paassword = data;
                          },
                        ),
                      ],
                    )),
                customBtn(
                  ontap: () async {
                    if (formKey.currentState!.validate()) isloadin = true;
                    setState(() {});
                    {
                      try {
                        await registerUser();
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          handleWeakPasswordError(context);
                        } else if (e.code == 'email-already-in-use') {
                          alreadyExistEmal(context);
                        }
                      }
                      isloadin = false;
                      setState(() {});

                      signComplete(context);
                      Navigator.pushNamed(context, "welcome");
                    }
                  },
                  textBtn: "Sign UP",
                ),
                const SizedBox(
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
      ),
    );
  }

  void signComplete(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green.shade100,
        content: const Text(
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
        email: email!, password: paassword!);
    return user;
  }
}
