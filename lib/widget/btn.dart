import 'package:chaty/screen/signUp.dart';
import 'package:flutter/material.dart';

class customBtn extends StatelessWidget {
  // ignore: non_constant_identifier_names
  customBtn({super.key, required this.TextBtn, this.ontap});
  final String TextBtn;
  VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: ElevatedButton(
          onPressed: ontap,
          child: Text(
            TextBtn,
            style: TextStyle(fontSize: 23),
          ),
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll<Color>(Colors.white),
              shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: BorderSide(color: Colors.green)))),
        ),
      ),
    );
  }
}
