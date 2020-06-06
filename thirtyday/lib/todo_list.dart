import 'dart:async';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:thirtyday/challenges.dart';
import 'package:thirtyday/database_helper.dart';
import 'package:thirtyday/todo_detail.dart';
import 'package:sqflite/sqflite.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:thirtyday/drawer.dart';
import 'package:table_calendar/table_calendar.dart';

class NoteList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;

  @override
  Widget build(BuildContext context) {

    if (noteList == null) {
      noteList = List<Note>();
      updateListView();
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        title: Text('30Day', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: MainDrawer(),
      body: PageView(
        //controller: _page,
        //onPageChanged: (int) {
        // print('Page Changes to index $int');
        // },
        children: <Widget>[    // main container
          Container(
            color: Colors.grey[50],
            child: ListView(
              children: <Widget>[
                Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 5),),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Card(
                    //elevation: 40,
                    color: Color(0xFF42A5F5),//Colors.blueAccent,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(5)),
                        ListTile(
                          leading: Icon(OMIcons.whatshot, color: Colors.deepOrange, size: 30,),
                          title: Text('Newbie', style: TextStyle(fontSize: 22, color: Colors.white),),
                          subtitle: Text('20,365', style: TextStyle(fontSize: 16, color: Colors.white, ),),
                          // subtitle: Text(DateFormat("dd-MM-yyyy").format(DateTime.now()),),
                          trailing: Icon(OMIcons.barChart, size: 50), onTap: (){},
                        ),
                        Padding(padding: EdgeInsets.all(30)),
                      ],
                    ),
                  ),
                ),
                //Padding(padding: EdgeInsets.fromLTRB(20, 20, 0, 5),
                //  child: Text('Challenges', style: TextStyle(fontSize: 15, fontFamily: 'Proxima Sans'),),
               // ),
              ],
            )
            ,),
          getNoteListView(),
          //Container(child: getTodoListView(),),
        ],
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
                      //Navigator.pop(context); // MOVE this to settings--logout
                      Navigator.of(context).pushNamed("/SecondPage");
                    },
                  ),
                ),
                Expanded(child: IconButton(icon: const Icon(OMIcons.share),
                  color: Colors.black54,
                  iconSize: 30.0,
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
      backgroundColor: Colors.white,//Color(0xFFEEEEEE),



      //getNoteListView(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
          navigateToDetail(Note('', '', 2), 'Add Note');
        },

        tooltip: 'Add Note',

        child: Icon(Icons.add),

      ),
    );
  }

  ListView getNoteListView() {

    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(

            leading: CircleAvatar(
              backgroundColor: getPriorityColor(this.noteList[position].priority),
              child: getPriorityIcon(this.noteList[position].priority),
            ),

            title: Text(this.noteList[position].title, style: titleStyle,),

            subtitle: Text(this.noteList[position].date),

            trailing: GestureDetector(
              child: Icon(Icons.delete, color: Colors.grey,),
              onTap: () {
                _delete(context, noteList[position]);
              },
            ),


            onTap: () {
              debugPrint("ListTile Tapped");
              navigateToDetail(this.noteList[position],'Edit Note');
            },

          ),
        );
      },
    );
  }

  // Returns the priority color
  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.yellow;
        break;

      default:
        return Colors.yellow;
    }
  }

  // Returns the priority icon
  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Icon(Icons.play_arrow);
        break;
      case 2:
        return Icon(Icons.keyboard_arrow_right);
        break;

      default:
        return Icon(Icons.keyboard_arrow_right);
    }
  }

  void _delete(BuildContext context, Note note) async {

    int result = await databaseHelper.deleteNote(note.id);
    if (result != 0) {
      _showSnackBar(context, 'Note Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {

    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(Note note, String title) async {
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetail(note, title);
    }));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {

    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {

      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }
}