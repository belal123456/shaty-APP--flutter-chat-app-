import 'package:flutter/material.dart';

class Textinputfileds extends StatelessWidget {
  const Textinputfileds(
      {super.key,
      this.onchanged,
      this.formKey,
      this.validator,
      required this.hint,
      required this.label});
  final Function(String)? onchanged;
  final GlobalKey<FormState>? formKey;
  final String? Function(String?)? validator;
  final String hint;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white, fontSize: 20),
      validator: validator,
      onChanged: onchanged,
      decoration: InputDecoration(
        suffixIcon: const Icon(
          Icons.person_3_rounded,
          size: 30,
          color: Colors.white,
        ),
        labelText: label,
        labelStyle: const TextStyle(fontSize: 16, color: Colors.white),
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 12, color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green.shade400),
          borderRadius: BorderRadius.circular(24),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white, width: 2),
        ),
      ),
    );
  }
}
