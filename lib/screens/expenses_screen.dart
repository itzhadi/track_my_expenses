import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:track_my_expenses/components/item_list_view.dart';

import '../components/appbar_icons_actions.dart';
import '../components/between_dates_box.dart';
import '../components/horizontal_month_cal.dart';
import '../store/item_list.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/helper_functions.dart';

class Expenses extends StatelessWidget {
  static const String id = 'expense_screen';

  @override
  Widget build(BuildContext context) {
    final itemList = Provider.of<ItemList>(context);
    return Observer(
      builder: (_) => Scaffold(
        backgroundColor: main_color,
        appBar: AppBar(
          title: Visibility(
            visible: itemList.showSearch,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: CupertinoSearchTextField(
                prefixIcon: Icon(Icons.wallet),
                onChanged: (value) => itemList.setSerchItem(value),
                style: TextStyle(color: Colors.white60, fontSize: 13),
                placeholder: 'חפש',
                autofocus: false,
                itemColor: main_color,
              ),
            ),
          ),
          backgroundColor: main_color,
          toolbarHeight: 40,
          leading: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () {
                  itemList.toggleShowSearch();
                },
                splashRadius: 10,
                icon: Icon(
                  Icons.search,
                  color: Colors.white60,
                  size: 30,
                )),
          ),
          actions: [AppBarActionsIcons()],
        ),
        body: Column(
          children: [
            Container(
              color: main_color,
              padding: EdgeInsets.only(
                  top: 10.0, left: 30.0, right: 30.0, bottom: 5),
              child: Column(
                children: [
                  HorizontalMonthCalendar(),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            itemList.balance.isNegative
                                ? HelperFunctions.getNumberFormat(
                                            itemList.balance.abs())
                                        .toString() +
                                    '-'
                                : HelperFunctions.getNumberFormat(
                                        itemList.balance)
                                    .toString(),
                            style: TextStyle(
                              color: itemList.balance.isNegative ? red : green,
                              fontSize: 30,
                              fontFamily: 'Caprasimo',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              ' ' + kNewShekel,
                              style: TextStyle(
                                  color:
                                      itemList.balance.isNegative ? red : green,
                                  fontSize: 22,
                                  fontFamily: 'Caprasimo',
                                  fontWeight: FontWeight.w400),
                            ),
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
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 4.0),
                                    child: Text(
                                        HelperFunctions.getNumberFormat(
                                                itemList.totalIncomes)
                                            .toString(),
                                        style: kTextExpenseAndIncomes),
                                  ),
                                  Text(
                                    ' ' + kNewShekel,
                                    style: kNewShekelStyle,
                                  )
                                ],
                              ),
                            ],
                          ),
                          BetweenDatesBox(
                              startDate: itemList.dayStartDate!,
                              endDate: itemList.dayEndDate!),
                          Column(
                            children: [
                              Text(
                                'הוצאות',
                                style: kTextExpenseScreen,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 4.0),
                                    child: Text(
                                      HelperFunctions.getNumberFormat(
                                              itemList.totalExpenses)
                                          .toString(),
                                      style: kTextExpenseAndIncomes,
                                    ),
                                  ),
                                  Text(
                                    ' ' + kNewShekel,
                                    style: kNewShekelStyle,
                                  )
                                ],
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
                child: ItemListView(),
                decoration: BoxDecoration(
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
      ),
    );
  }
}
