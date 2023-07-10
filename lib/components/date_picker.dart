import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import 'package:flutter_timeline_calendar/timeline/widget/timeline_calendar.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:table_calendar/table_calendar.dart';

import '../utils/constants.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  String? month;
  String? year;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    month = DateTime.now().month.toString();
    year = DateTime.now().year.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TableCalendar(
      locale: 'he',
      calendarFormat: CalendarFormat.month,
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
    ));

    // return Container(
    //     child: Column(
    //   children: [
    //     HorizontalCalendar(
    //       date: DateTime.now(),
    //       textColor: Colors.black45,
    //       backgroundColor: Colors.white,
    //       selectedColor: Colors.blue,
    //       showMonth: true,
    //       onDateSelected: (date) {
    //         print(date.toString());
    //       },
    //     ),
    //   ],
    // ));

    // return Container(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           IconButton(
    //               onPressed: () {},
    //               icon: Icon(
    //                 Icons.arrow_back_ios,
    //                 color: Colors.black,
    //               )),
    //           Padding(
    //             padding: const EdgeInsets.only(left: 30, right: 30),
    //             child: Text(
    //               '${months[month]} 2023',
    //               style: TextStyle(fontSize: 20, color: Colors.black),
    //             ),
    //           ),
    //           IconButton(
    //               onPressed: () {},
    //               icon: Icon(
    //                 Icons.arrow_back_ios_new,
    //                 color: Colors.black,
    //               ))
    //         ],
    //       )
    //     ],
    //   ),
    // );
  }
}
// return Container(
//   child: TimelineCalendar(
//     calendarType: CalendarType.GREGORIAN,
//     calendarLanguage: "en",
//     onChangeDateTime: (datetime) {
//       print(datetime.getDate());
//     },
//   ),
// );

// return Container(
//   child: EventCalendar(
//     calendarType: CalendarType.GREGORIAN,
//     calendarLanguage: 'en',
//     calendarOptions:
//         CalendarOptions(toggleViewType: false, viewType: ViewType.MONTHLY),
//     events: [
//       Event(
//         child: const Text('Laravel Event'),
//         dateTime: CalendarDateTime(
//           year: 1401,
//           month: 5,
//           day: 12,
//           calendarType: CalendarType.GREGORIAN,
//         ),
//       ),
//     ],
//   ),
// );
