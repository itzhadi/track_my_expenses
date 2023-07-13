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
                  list.addItemModel('קניות', 100, DateTime.now(), false, false);
                })
          ],
        ),
      ),
    );
  }
}
