import 'package:flutter/material.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';

class HorCalen extends StatelessWidget {
  const HorCalen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10.0),
        child: HorizontalCalendar(
          locale: Locale('he'),
          showMonth: true,
          date: DateTime.now(),
          onDateSelected: (date) {
            print(date);
          },
        ));
  }
}
