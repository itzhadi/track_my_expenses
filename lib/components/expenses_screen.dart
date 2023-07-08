import 'package:flutter/material.dart';

class Expenses extends StatelessWidget {
  static const String id = 'expense_screen';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "Expenses",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
