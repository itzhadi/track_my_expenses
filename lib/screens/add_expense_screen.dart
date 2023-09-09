import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:track_my_expenses/store/item_list.dart';
import 'package:track_my_expenses/utils/colors.dart';

import '../store/add_expense_store.dart';
import '../utils/constants.dart';

class AddExpense extends StatelessWidget {
  static const String id = 'expense_screen';

  @override
  Widget build(BuildContext context) {
    final addExpensesStore = Provider.of<AddExpensesStore>(context);
    final list = Provider.of<ItemList>(context);
    int labelIndexIsPermanent = 0;
    int lableIndexIsExpense = 0;

    return Observer(
      builder: (_) => Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: ToggleSwitch(
                minWidth: 90.0,
                initialLabelIndex: lableIndexIsExpense,
                cornerRadius: 10.0,
                activeFgColor: Colors.white70,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white70,
                customTextStyles: [kToggleButton, kToggleButton],
                totalSwitches: 2,
                labels: ['הוצאה', 'הכנסה'],
                activeBgColors: [
                  [red],
                  [green]
                ],
                onToggle: (index) {
                  lableIndexIsExpense = index!;
                  addExpensesStore.toggleIsExpense();
                },
              ),
            ),
            Container(
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white70, // Border color
                  width: 0.20,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 8.0, left: 15.0, right: 15),
                      child: TextField(
                        maxLength: 40,
                        cursorColor: Colors.white30,
                        textAlign: TextAlign.center,
                        style: kTextAlertEditDialog,
                        decoration: InputDecoration(
                          hintText: "תיאור",
                          hintStyle: TextStyle(
                              color: Colors.white30,
                              fontWeight: FontWeight.w100,
                              fontSize: 20),
                          counterText: "",
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 0.15, color: Colors.white70),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 0.15, color: Colors.white70),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, left: 15.0, right: 15),
                      child: TextField(
                        maxLength: 8,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter
                              .digitsOnly // Input filter to allow only digits
                        ],
                        style: kTextAlertEditDialog,
                        decoration: InputDecoration(
                          hintText: "סכום",
                          hintStyle: TextStyle(
                              color: Colors.white30,
                              fontWeight: FontWeight.w100,
                              fontSize: 20),
                          counterText: "",
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 0.15, color: Colors.white70),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 0.15, color: Colors.white70),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                padding: EdgeInsetsDirectional.only(
                                    start: 2, bottom: 25),
                                onPressed: () {
                                  //selectDate(context);
                                },
                                splashRadius: 10,
                                icon: Icon(
                                  Icons.date_range,
                                  size: 46,
                                  color: Colors.white60,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Text(
                                  "09/09/2023",
                                  style: TextStyle(
                                      color: Colors.white54, fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              children: [
                                ToggleSwitch(
                                  minWidth: 50.0,
                                  minHeight: 40.0,
                                  initialLabelIndex: labelIndexIsPermanent,
                                  cornerRadius: 11.0,
                                  activeFgColor: Colors.white,
                                  inactiveBgColor: Colors.grey,
                                  inactiveFgColor: Colors.white,
                                  totalSwitches: 2,
                                  icons: [
                                    Icons.push_pin_outlined,
                                    Icons.push_pin_sharp
                                  ],
                                  iconSize: 30.0,
                                  activeBgColors: [
                                    [Colors.black45, Colors.black26],
                                    [Colors.black45, Colors.black26]
                                  ],
                                  onToggle: (index) {
                                    labelIndexIsPermanent = index!;
                                    addExpensesStore.toggleIsPermanent(index);
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    addExpensesStore.isPermanentToggleText,
                                    style: TextStyle(
                                        color: Colors.white54, fontSize: 10),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 35),
                    MaterialButton(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Text(
                            "הוסף",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        textColor: Colors.white30,
                        height: 45,
                        minWidth: 100,
                        disabledColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: Colors.white30,
                            width: 0.7,
                          ),
                        ),
                        color: main_color,
                        onPressed: () {
                          list.addItemModel(
                              '${new Random().nextInt(10 - 1)}קניות',
                              100 + new Random().nextInt(100 - 10),
                              new DateTime(
                                  DateTime.now().year,
                                  DateTime.now().month,
                                  1 + new Random().nextInt(29 - 1)),
                              addExpensesStore.getIsExpense,
                              addExpensesStore.getIsPermanent,
                              UniqueKey());
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
