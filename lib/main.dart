import 'package:chaty/firebase_options.dart';
import 'package:chaty/screen/login.dart';
import 'package:chaty/screen/signUp.dart';
import 'package:chaty/screen/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const home());
}

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "LoginPage": (context) => Login(),
        "signup": (context) => signUp(),
        "welcome": (context) => const Welcome(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: "LoginPage",
    );
  }
}
