import 'package:flutter/material.dart';

class AddExpense extends StatelessWidget {
  static const String id = 'expense_screen';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "AddExpense",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
