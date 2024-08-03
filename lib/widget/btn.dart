import 'package:flutter/material.dart';

class customBtn extends StatelessWidget {
  const customBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: ElevatedButton(
          onPressed: null,
          child: Text(
            "login",
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
