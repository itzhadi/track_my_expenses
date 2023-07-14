import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:track_my_expenses/components/item_list_view.dart';

import '../components/horizontal_month_cal.dart';
import '../store/item_list.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';

class Expenses extends StatelessWidget {
  static const String id = 'expense_screen';
  bool vertical = false;
  NumberFormat myFormat = NumberFormat.decimalPattern('en_us');

  getNumberFormat(int val) => val > 9999 ? myFormat.format(val) : val;

  @override
  Widget build(BuildContext context) {
    final itemList = Provider.of<ItemList>(context);
    return Scaffold(
      backgroundColor: pub_dev,
      body: Column(
        children: [
          Container(
            color: pub_dev,
            padding:
                EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0, bottom: 5),
            child: Observer(
              builder: (_) => Column(
                children: [
                  HorizontalMonthCalendar(),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            itemList.balance!.isNegative
                                ? getNumberFormat(itemList.balance!.abs())
                                        .toString() +
                                    '-'
                                : getNumberFormat(itemList.balance!).toString(),
                            style: TextStyle(
                              color: itemList.balance!.isNegative ? red : green,
                              fontSize: 30,
                              fontFamily: 'Caprasimo',
                            ),
                          ),
                          Text(
                            ' ' + kNewShekel,
                            style: TextStyle(
                                color:
                                    itemList.balance!.isNegative ? red : green,
                                fontSize: 30,
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
                              Text(
                                  getNumberFormat(itemList.totalIncomes)
                                      .toString(),
                                  style: kTextExpenseScreen1),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'הוצאות',
                                style: kTextExpenseScreen,
                              ),
                              Text(
                                getNumberFormat(itemList.totalExpenses)
                                    .toString(),
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
          ),
          Expanded(
            child: Container(
              child: ItemListView(),
              decoration: BoxDecoration(
                //border: Border.all(width: 1, color: Colors.white60),
                color: off_white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25.0),
                    topLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
