import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class HorizontalMonthCalendar extends StatefulWidget {
  @override
  _HorizontalMonthCalendarState createState() =>
      _HorizontalMonthCalendarState();
}

class _HorizontalMonthCalendarState extends State<HorizontalMonthCalendar> {
  DateTime _currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
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
          onCalendarChanged: (date) {},
          thisMonthDayBorderColor: Colors.grey,
          height: 48.0,
          disableDayPressed: true,
          selectedDateTime: _currentDate,
          onHeaderTitlePressed: (date) {
            //Todo
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
