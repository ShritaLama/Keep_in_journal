import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:keepinjournal/calender/newevent.dart';
import 'package:table_calendar/table_calendar.dart';


class UserCalender extends StatefulWidget {
  const UserCalender({Key? key}) : super(key: key);

  @override
  State<UserCalender> createState() => _UserCalenderState();
}

class _UserCalenderState extends State<UserCalender> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;

  Map<String, List> mySelectedEvents = {};

  final titleController = TextEditingController();
  final descpController = TextEditingController();
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDate = _focusedDay;

    loadPreviousEvents();
  }
  loadPreviousEvents() {
    mySelectedEvents = {
      "2022-09-13": [
        {"eventDescp": "11", "eventTitle": "111"},
        {"eventDescp": "22", "eventTitle": "22"}
      ],
      "2022-09-30": [
        {"eventDescp": "22", "eventTitle": "22"}
      ],
      "2022-09-20": [
        {"eventTitle": "ss", "eventDescp": "ss"}
      ]
    };
  }

  List _listOfDayEvents(DateTime dateTime) {
    if (mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else {
      return [];
    }
  }
 @override
  Widget build(BuildContext context) {
   return SafeArea(
       child: Scaffold(
         body: Padding(
           padding: const EdgeInsets.only(top: 8.0),
           child: Column(
             children: [
               TableCalendar(
                 firstDay: DateTime(2022),
                 lastDay: DateTime(2023),
                 focusedDay: _focusedDay,
                 calendarFormat: _calendarFormat,
                 onDaySelected: (selectedDay, focusedDay) {
                   if (!isSameDay(_selectedDate, selectedDay)) {
                     // Call `setState()` when updating the selected day
                     setState(() {
                       _selectedDate = selectedDay;
                       _focusedDay = focusedDay;
                     });
                   }
                 },
                 selectedDayPredicate: (day) {
                   return isSameDay(_selectedDate, day);
                 },
                 onFormatChanged: (format) {
                   if (_calendarFormat != format) {
                     // Call `setState()` when updating calendar format
                     setState(() {
                       _calendarFormat = format;
                     });
                   }
                 },
                 onPageChanged: (focusedDay) {
                   // No need to call `setState()` here
                   _focusedDay = focusedDay;
                 },
                 eventLoader: _listOfDayEvents,
               ),
               ..._listOfDayEvents(_selectedDate!).map(
                     (myEvents) => ListTile(
                   leading: const Icon(
                     Icons.done,
                     color: Colors.purple,
                   ),
                   title: Padding(
                     padding: const EdgeInsets.only(bottom: 8.0),
                     child: Text('Event Title:   ${myEvents['eventTitle']}'),
                   ),
                   subtitle: Text('Description:   ${myEvents['eventDescp']}'),
                 ),
               ),
             ],
           ),
         ),
         floatingActionButton: FloatingActionButton.extended(
           onPressed: () {
             Navigator.push(context,
                 MaterialPageRoute(builder: (context) => NewEvent()));
           },
           label: const Text('New Event'),
           backgroundColor: Colors.deepPurpleAccent.shade100,
         ),
       )
   );
  }
}
