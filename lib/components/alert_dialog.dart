import 'package:flutter/material.dart';
import 'package:track_my_expenses/utils/colors.dart';

import '../utils/constants.dart';

class AlertDialogPopup extends StatelessWidget {
  final String title;
  final String message;
  final Function onConfirm;

  AlertDialogPopup(
      {required this.title, required this.message, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0), // Adjust the value as needed
      ),
      backgroundColor: main_color,
      title: Text(
        title,
        style: kTextAlertDialogTitle,
      ),
      content: Text(
        message,
        style: kTextAlertDialog,
      ),
      actions: [
        TextButton(
          child: Text(
            'בטל',
            style: TextStyle(
                fontFamily: 'SecularOne', color: Colors.white60, fontSize: 22),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(
            'כן',
            style: TextStyle(
                fontFamily: 'SecularOne',
                color: red,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            onConfirm();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
