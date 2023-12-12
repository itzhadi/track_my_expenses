import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:provider/provider.dart';

import '../store/item_list.dart';
import '../utils/helper_functions.dart';

class HorizontalMonthCalendar extends StatefulWidget {
  @override
  _HorizontalMonthCalendarState createState() =>
      _HorizontalMonthCalendarState();
}

class _HorizontalMonthCalendarState extends State<HorizontalMonthCalendar> {
  DateTime _currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<ItemList>(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 20.0, bottom: 3),
        child: CalendarCarousel<Event>(
          customDayBuilder: null,
          daysHaveCircularBorder: false,
          locale: 'he',
          headerTextStyle: TextStyle(
              color: Colors.white60, fontSize: 25, fontWeight: FontWeight.bold),
          headerMargin: EdgeInsets.only(right: 1, left: 1),
          weekFormat: false,
          showWeekDays: false,
          showOnlyCurrentMonthDate: true,
          iconColor: Colors.white60,
          markedDateIconBorderColor: Colors.black,
          onCalendarChanged: (date) {
            list.setCurrentMonth(date);
            final firstDayOfMonth = DateTime(date.year, date.month, 1);
            final lastDayOfMonth = DateTime(date.year, date.month + 1, 0);
            list.setStartEndDates(firstDayOfMonth, lastDayOfMonth);
            list.toggleShowDateRange(false);
            list.setStartEndDateRange(
              DateTimeRange(
                start: DateTime(
                    list.currentYear,
                    HelperFunctions.getMonthNumber(list.getCurrentMonthName),
                    1),
                end: DateTime(
                    list.currentYear,
                    HelperFunctions.getMonthNumber(list.getCurrentMonthName) +
                        1,
                    0),
              ),
            );
          },
          thisMonthDayBorderColor: Colors.grey,
          height: 48.0,
          disableDayPressed: true,
          selectedDateTime: _currentDate,
          onHeaderTitlePressed: (date) {
            print(date.toString());
          },

          //daysHaveCircularBorder: false,
          customGridViewPhysics: NeverScrollableScrollPhysics(),
          // markedDatesMap: _getMarkedDateMap(),
          // markedDateCustomShapeBorder:
          //     CircleBorder(side: BorderSide(color: Colors.yellow)),
          // markedDateCustomTextStyle:
          //     TextStyle(fontSize: 18.0, color: Colors.black),
          // showOnlyCurrentMonthDate: true,
          // markedDateIconBuilder: (event) {
          //   return event.icon;
          // },
          // todayTextStyle: TextStyle(color: Colors.black),
          // todayButtonColor: Colors.transparent,
          // todayBorderColor: Colors.transparent,
          // markedDateShowIcon: true,
          // markedDateIconMaxShown: 1,
        ),
      ),
    );
  }

  // Helper function to create marked date map
  Map<DateTime, List<Event>> _getMarkedDateMap() {
    return {
      DateTime.now().subtract(Duration(days: 2)): [
        Event(
            date: DateTime.now().subtract(Duration(days: 2)),
            icon: Icon(Icons.event)),
      ],
      DateTime.now().subtract(Duration(days: 3)): [
        Event(
            date: DateTime.now().subtract(Duration(days: 3)),
            icon: Icon(Icons.event)),
      ],
      DateTime.now().subtract(Duration(days: 7)): [
        Event(
            date: DateTime.now().subtract(Duration(days: 7)),
            icon: Icon(Icons.event)),
      ],
      DateTime.now().subtract(Duration(days: 10)): [
        Event(
            date: DateTime.now().subtract(Duration(days: 10)),
            icon: Icon(Icons.event)),
      ],
    };
  }
}
