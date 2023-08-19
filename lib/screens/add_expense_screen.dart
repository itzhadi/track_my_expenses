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
        child: Center(
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
                        '${new Random().nextInt(10 - 1)}קניות',
                        100 + new Random().nextInt(100 - 10),
                        new DateTime(DateTime.now().year, DateTime.now().month,
                            1 + new Random().nextInt(29 - 1)),
                        false,
                        Random().nextBool(),
                        UniqueKey());
                  }),
              MaterialButton(
                  color: Colors.red,
                  onPressed: () {
                    list.addItemModel(
                        '${new Random().nextInt(10 - 1)}קניות',
                        100 + new Random().nextInt(100 - 10),
                        new DateTime(DateTime.now().year, DateTime.now().month,
                            1 + new Random().nextInt(29 - 1)),
                        true,
                        Random().nextBool(),
                        UniqueKey());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
