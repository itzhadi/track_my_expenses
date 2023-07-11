import 'package:flutter/material.dart';

import '../components/horizontal_month_cal.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';

class Expenses extends StatelessWidget {
  static const String id = 'expense_screen';
  final int? balance = -500;

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
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15.0),
                      topLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text('הוצאות', style: kTextExpenseScreen),
                            Text('500', style: kTextExpenseScreen1),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              balance.toString(),
                              style: kTextExpenseScreen,
                            ),
                            Text(
                              kNewShekel,
                              style: kTextExpenseScreen,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'הכנסות',
                              style: kTextExpenseScreen,
                            ),
                            Text(
                              '500',
                              style: kTextExpenseScreen1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
