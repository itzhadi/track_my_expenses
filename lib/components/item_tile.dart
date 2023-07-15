import 'package:flutter/material.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:intl/intl.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/helper_functions.dart';

class ItemTile extends StatelessWidget {
  ItemTile(
      {this.description,
      this.amount,
      this.date,
      this.isExpense,
      this.isPermanent});

  String? description;
  String? amount;
  DateTime? date;
  bool? isExpense;
  bool? isPermanent;

  @override
  Widget build(BuildContext context) {
    return GFListTile(
      title: Padding(
        padding: const EdgeInsets.only(right: 3.0, bottom: 2.0, top: 2.0),
        child: Text(
          description!,
          style: TextStyle(
              color: isExpense! ? red : green,
              fontSize: 16,
              fontFamily: 'Oswald',
              fontWeight: FontWeight.w800),
        ),
      ),
      subTitle: Padding(
        padding: const EdgeInsets.only(right: 3.0, bottom: 2.0, top: 2.0),
        child: Text(
          HelperFunctions.getNumberFormat(int.parse(amount!)).toString() +
              ' ' +
              kNewShekel,
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      color: Colors.white70,
      description: Padding(
        padding: const EdgeInsets.only(right: 3.0, bottom: 2.0, top: 2.0),
        child: Text(
          HelperFunctions.getDateFormat(date!),
          style: TextStyle(
              color: Colors.black, fontSize: 10, fontWeight: FontWeight.w500),
        ),
      ),
      icon: isPermanent! ? Icon(Icons.push_pin, color: Colors.black38) : null,
      //avatar: GFAvatar(size: 25, backgroundColor: green),
    );
  }
}
