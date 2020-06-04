import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget{
  @override
  CalendarState createState() => CalendarState();
}
class CalendarState extends State<Calendar> {
  CalendarController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();
  }
  @override
  Widget build(BuildContext context) {

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, MMM d, yyyy').format(now);
    return Scaffold(
        appBar: AppBar(
          title: Text(formattedDate),
    ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(calendarController: _controller,)
          ],
        ),
      ),
    );
  }
}