import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:track_my_expenses/store/item_list.dart';

class AddExpense extends StatelessWidget {
  static const String id = 'expense_screen';

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<ItemList>(context);
    return Center(
      child: Container(
        child: Column(
          children: [
            Text(
              "AddExpense",
              style: TextStyle(
                  color: Colors.blueGrey, fontWeight: FontWeight.bold),
            ),
            MaterialButton(
                color: Colors.green,
                onPressed: () {
                  list.addItemModel(
                      '5קניות',
                      100,
                      new DateTime(
                          2020 + new Random().nextInt(2023 - 2020),
                          1 + new Random().nextInt(12 - 1),
                          1 + new Random().nextInt(25 - 1)),
                      Random().nextBool(),
                      Random().nextBool());
                })
          ],
        ),
      ),
    );
  }
}
