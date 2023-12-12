import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../store/item_list.dart';
import '../utils/constants.dart';
import '../utils/helper_functions.dart';

class BetweenDatesBox extends StatelessWidget {
  const BetweenDatesBox({
    super.key,
    required this.startDate,
    required this.endDate,
  });

  final String? startDate;
  final String? endDate;

  @override
  Widget build(BuildContext context) {
    final itemList = Provider.of<ItemList>(context);

    resetDates() {
      itemList.toggleShowDateRange(false);
      itemList.setStartEndDateRange(
        DateTimeRange(
          start: DateTime(itemList.currentYear,
              HelperFunctions.getMonthNumber(itemList.getCurrentMonthName), 1),
          end: DateTime(
              itemList.currentYear,
              HelperFunctions.getMonthNumber(itemList.getCurrentMonthName) + 1,
              0),
        ),
      );
    }

    return AnimatedSwitcher(
      duration: Duration(seconds: 1),
      transitionBuilder: (child, animation) {
        return RotationTransition(
          turns: animation,
          child: child,
        );
      },
      child: itemList.getShowDateRange!
          ? InkWell(
              onTap: () {
                resetDates();
              },
              child: Container(
                width: 100,
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white70, // Border color
                    width: 0.20,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 5.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: IconButton(
                          icon: Icon(
                            Icons.restart_alt_outlined,
                            color: Colors.white60,
                            size: 17,
                          ),
                          onPressed: () {
                            resetDates();
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            HelperFunctions.getZeroChain(endDate!),
                            style: kDate,
                          ),
                          Text(
                            ' - ',
                            style: kDate,
                          ),
                          Text(
                            HelperFunctions.getZeroChain(startDate!),
                            style: kDate,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
