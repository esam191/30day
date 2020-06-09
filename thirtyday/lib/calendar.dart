import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
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
        backgroundColor: Colors.white,
        title: Text(formattedDate, style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(calendarController: _controller,)
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 50,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //children: bottomAppBarButtons,
              children: <Widget>[
                Expanded(
                  child: IconButton(icon: const Icon(OMIcons.home),
                    color: Colors.black54,
                    iconSize: 30.0,
                    //padding: EdgeInsets.only(left: 28.0),
                    tooltip: 'Go to home',
                    onPressed: () {
                      /// Go back to login page.
                      /// TODO: put this pop inside settings
                      Navigator.of(context).pushNamed("/SecondPage");
                      //Navigator.pop(context); // MOVE this to settings--logout
                    },
                  ),
                ),
                Expanded(child: IconButton(icon: const Icon(OMIcons.barChart),
                  color: Colors.black54,
                  iconSize: 35.0,
                  //padding: EdgeInsets.only(right: 28.0),
                  tooltip: 'Go to share',
                  onPressed: () {},
                ),
                ),
                Expanded(child: IconButton(icon: const Icon(OMIcons.calendarToday),
                  color: Colors.black54,
                  iconSize: 30.0,
                  //padding: EdgeInsets.only(right: 128.0),
                  tooltip: 'Go to calendar',
                  onPressed: () {Navigator.of(context).pushNamed("/CalendarPage");},
                ),
                ),
              ],
            ),
          )
      ),
    );
  }
}