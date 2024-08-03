import 'package:chaty/screen/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const home());
}

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Login(),
      ),
    );
  }
}
