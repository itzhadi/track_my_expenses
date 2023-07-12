import 'package:flutter/material.dart';

import '../components/horizontal_month_cal.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';

class Expenses extends StatelessWidget {
  static const String id = 'expense_screen';
  final int? balance = 1500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: balance! >= 0 ? green : red,
      backgroundColor: Color(0xFF4E4E5A),
      body: Column(
        children: [
          Container(
            padding:
                EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0, bottom: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HorizontalMonthCalendar(),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          balance!.isNegative
                              ? balance!.abs().toString() + '-'
                              : balance.toString(),
                          style: TextStyle(
                              color: balance!.isNegative ? red : green,
                              fontSize: 38,
                              fontFamily: 'Caprasimo'),
                          // textAlign: TextAlignVertical.,
                        ),
                        Text(
                          ' ' + kNewShekel,
                          style: TextStyle(
                              color: balance!.isNegative ? red : green,
                              fontSize: 38,
                              fontFamily: 'Caprasimo',
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text('הכנסות', style: kTextExpenseScreen),
                            Text('500', style: kTextExpenseScreen1),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'הוצאות',
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
                  ],
                ),
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
