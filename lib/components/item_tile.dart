import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

import '../utils/colors.dart';

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
      subTitle: Text(
        "500",
        style: TextStyle(color: Colors.black, fontSize: 13),
      ),
      color: Colors.white60,
      title: Text(
        description!,
        style: TextStyle(color: isExpense! ? red : green, fontSize: 15),
      ),
      description: Text(
        date.toString(),
        style: TextStyle(color: Colors.black, fontSize: 10),
      ),
      icon: Icon(Icons.pin_drop, color: Colors.black54),
      avatar: GFAvatar(size: 25, backgroundColor: green),
      hoverColor: Colors.blue,
    );
  }
}
