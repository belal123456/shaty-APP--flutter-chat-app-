import 'package:chaty/screen/login.dart';
import 'package:chaty/screen/signUp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const home());
}

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "LoginPage": (context) => const Login(),
        "signup": (context) => const signUp()
      },
      debugShowCheckedModeBanner: false,
      initialRoute: "LoginPage",
    );
  }
}
