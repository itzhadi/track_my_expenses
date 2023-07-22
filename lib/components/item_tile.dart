import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../store/item_list.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/helper_functions.dart';
import 'alert_dialog.dart';

class ItemTile extends StatelessWidget {
  ItemTile(
      {this.description,
      this.amount,
      this.date,
      this.isExpense,
      this.isPermanent,
      this.index});

  String? description;
  String? amount;
  DateTime? date;
  bool? isExpense;
  bool? isPermanent;
  int? index;

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<ItemList>(context);
    return Slidable(
      key: UniqueKey(),
      closeOnScroll: true,
      startActionPane: ActionPane(
        motion: StretchMotion(),
        dismissible: DismissiblePane(onDismissed: () {
          list.removeItem(list.items[index!]);
        }),
        children: [
          SlidableAction(
            foregroundColor: isPermanent! ? Colors.black : Colors.white,
            backgroundColor: Colors.grey,
            onPressed: (context) {
              list.tooglePinItem(index!);
            },
            icon: Icons.push_pin,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          SlidableAction(
            backgroundColor: main_color,
            onPressed: (context) {
              showAnimatedDialog(
                barrierDismissible: true,
                context: context,
                builder: (BuildContext context) {
                  return AlertDialogPopup(
                      title: description!,
                      message: '$amount  $date',
                      onConfirm: () {
                        print('hello');
                      });
                },
                animationType: DialogTransitionType.fadeScale,
                curve: Curves.decelerate,
                duration: Duration(seconds: 1),
              );
            },
            icon: Icons.edit,
          ),
          SlidableAction(
            backgroundColor: red,
            onPressed: (context) {
              list.removeItem(list.items[index!]);
            },
            icon: Icons.delete,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ],
      ),
      child: GFListTile(
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
          child: Row(
            children: [
              Text(
                HelperFunctions.getNumberFormat(int.parse(amount!)).toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                ' ' + kNewShekel,
                style: kNewShekelTileStyle,
              )
            ],
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
      ),
    );
  }
}
