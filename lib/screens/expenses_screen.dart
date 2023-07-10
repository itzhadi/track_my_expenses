import 'package:flutter/material.dart';

import '../components/date_picker.dart';
import '../components/hor_cal.dart';
import '../components/horizontal_calendar.dart';
import '../utils/colors.dart';

class Expenses extends StatelessWidget {
  static const String id = 'expense_screen';
  final int? balance = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: balance! >= 0 ? green : red,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 50.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              children: [
                HorizontalMonthCalendar(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [Text('הוצאות'), Text('500')],
                    ),
                    Row(
                      children: [Text("balance"), Text("שח")],
                    ),
                    Column(
                      children: [Text('הכנסות'), Text('500')],
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25.0),
                    topLeft: Radius.circular(25.0),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
