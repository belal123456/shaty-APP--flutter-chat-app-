import 'package:flutter/material.dart';

class Textinputfileds extends StatelessWidget {
  Textinputfileds({super.key, this.onchanged});
  Function(String)? onchanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchanged,
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.person_3_rounded,
          size: 30,
          color: Colors.white,
        ),
        labelText: "User Name",
        labelStyle: TextStyle(fontSize: 16, color: Colors.white),
        hintText: "Enter user name",
        hintStyle: TextStyle(fontSize: 12, color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green.shade400),
          borderRadius: BorderRadius.circular(24),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
      ),
    );
  }
}
