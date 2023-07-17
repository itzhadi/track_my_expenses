import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:provider/provider.dart';

import '../store/item_list.dart';
import 'alert_dialog.dart';

class AppBarActionsIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemList = Provider.of<ItemList>(context);
    return Visibility(
      visible: itemList.showActionsBar,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(right: 53.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                splashRadius: 10,
                icon: Icon(
                  Icons.settings,
                  size: 30,
                  color: Colors.white60,
                ),
              ),
              IconButton(
                  onPressed: !itemList.items.isEmpty
                      ? () {
                          showAnimatedDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialogPopup(
                                  title: 'למחוק הכל ?',
                                  message:
                                      ' האם ברצונך למחוק את כל ההכנסות וההוצאות של החודש? ',
                                  onConfirm: () {
                                    itemList.removeAllItems();
                                  });
                            },
                            animationType: DialogTransitionType.fadeScale,
                            curve: Curves.decelerate,
                            duration: Duration(seconds: 1),
                          );
                        }
                      : null,
                  splashRadius: 10,
                  icon: Icon(
                    Icons.delete_forever,
                    size: 30,
                    color: !itemList.items.isEmpty
                        ? Colors.white60
                        : Colors.white10,
                  )),
              IconButton(
                onPressed: () {},
                splashRadius: 10,
                icon: Icon(
                  Icons.date_range,
                  size: 30,
                  color: Colors.white60,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
