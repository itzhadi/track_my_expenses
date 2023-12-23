import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:provider/provider.dart';
import 'package:track_my_expenses/utils/helper_functions.dart';

import '../store/item_list.dart';
import '../utils/colors.dart';
import 'alert_dialog.dart';

class AppBarActionsIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemList = Provider.of<ItemList>(context);
    Future<DateTimeRange?> selectDate(BuildContext context) async {
      final DateTimeRange? result = await showDateRangePicker(
          context: context,
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          firstDate: DateTime(itemList.currentYear,
              HelperFunctions.getMonthNumber(itemList.getCurrentMonthName), 1),
          lastDate: DateTime(
              itemList.currentYear,
              HelperFunctions.getMonthNumber(itemList.getCurrentMonthName) + 1,
              0),
          currentDate: DateTime.now(),
          locale:
              Locale("he", "IL"), // Set the locale to English (United States)
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.dark(
                background: main_color,
                onBackground: main_color,
                primary: Colors.white70,
                onSurface: Colors.white70,
              )),
              child: child!,
            );
          });

      if (result != null) {
        itemList.toggleShowDateRange(true);
        itemList.setStartEndDateRange(result);
      }
    }

    return Visibility(
      visible: itemList.showActionsBar,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(right: 53.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  itemList.setStartEndDateRange(DateTimeRange(
                      start: DateTime(1900), end: DateTime(1900)));
                },
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
                                      " האם ברצונך למחוק את כל ההכנסות וההוצאות של ${itemList.getCurrentMonthName}? ",
                                  onConfirm: () {
                                    itemList.removeAllItems();
                                  });
                            },
                            animationType: DialogTransitionType.fadeScale,
                            curve: Curves.decelerate,
                            duration: Duration(milliseconds: 600),
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
                onPressed: () {
                  selectDate(context);
                },
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
