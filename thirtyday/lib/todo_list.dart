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
import 'package:thirtyday/FadeAnimation.dart';

class NoteList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
 
  static final PageController _page = PageController(
    initialPage: 0,
  );
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
        
        controller: _page,
        onPageChanged: (int) {
         print('Page Changes to index $int');  
        },
        children: <Widget>[    // main container
          Container(
            color: Colors.grey[50],
            child: ListView(
              children: <Widget>[
                Padding(padding: EdgeInsets.fromLTRB(20, 5, 20, 5),),
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/img4.jpg'),
                    ),
                    color: Colors.blue,
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(15),
                    leading: Icon(OMIcons.whatshot, color: Colors.deepOrange, size: 30,),
                    title: Text('Newbie', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),
                    subtitle: Text('20,365', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold ),),
                    // subtitle: Text(DateFormat("dd-MM-yyyy").format(DateTime.now()),),
                    trailing: Icon(OMIcons.localBar, size: 60), onTap: (){},
                  ),

                ),

               /* ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Card(
                    //elevation: 40,
                    //color:Color.fromRGBO(111, 194, 173, 1.0),//Colors.blueAccent,
                    color: Color.fromRGBO(99, 138, 223, 1.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                       Padding(padding: EdgeInsets.all(15)),
                        ListTile(
                          leading: Icon(OMIcons.whatshot, color: Colors.deepOrange, size: 30,),
                          title: Text('Newbie', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),
                          subtitle: Text('20,365', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold ),),
                          // subtitle: Text(DateFormat("dd-MM-yyyy").format(DateTime.now()),),
                          trailing: Icon(OMIcons.localBar, size: 60), onTap: (){},
                        ),
                       Padding(padding: EdgeInsets.all(60)),
                      ],
                    ),
                  ),
                ), */
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(child: FadeAnimation(1, Text("Discover", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800], fontSize: 20),)),
                      padding: EdgeInsets.only(left: 12.0, top: 10.0),
                    ),
                    
                    SizedBox(height: 20,),
                    FadeAnimation(1.4, Container(
                      //padding: EdgeInsets.only(left: 10.0),
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          makeItem(image: 'images/img1.png', title: 'Canada'),
                          makeItem(image: 'images/img2.png', title: 'Italy'),
                          makeItem(image: 'images/img3.png', title: 'Greece'),
                          makeItem(image: 'images/img1.png', title: 'United States')
                        ],
                      ),
                    )),
                   SizedBox(height: 20,),

                   /*
                   Container( child:
                   FadeAnimation(1, Text("Best Hotels", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800], fontSize: 20), )),
                     padding: EdgeInsets.only(left: 12.0),
                   ),

                    SizedBox(height: 20,),
                    FadeAnimation(1.4, Container(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          makeItem(image: 'images/img3.png', title: 'Greece'),
                          makeItem(image: 'images/img2.png', title: 'Italy'),
                          makeItem(image: 'images/img2.png', title: 'Italy'),
                          makeItem(image: 'images/img1.png', title: 'United States'),
                        ],
                      ),
                    )),

                    */
                    SizedBox(height: 20,),
                  ],
                ),

                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Card(
                    //elevation: 40,
                    color:
                    //Color(0xFF42A5F5),
                    Colors.black54,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(5)),
                        ListTile(
                          leading: Icon(OMIcons.dataUsage, color: Colors.deepOrange, size: 30,),
                          title: Text('Challenges', style: TextStyle(fontSize: 22, color: Colors.white),),
                          //subtitle: Text('swipe right', style: TextStyle(fontSize: 16, color: Colors.black, ),),
                          // subtitle: Text(DateFormat("dd-MM-yyyy").format(DateTime.now()),),
                          trailing: Icon(Icons.keyboard_arrow_right, size: 50), onTap: (){
                              _page.animateToPage(1, curve: Curves.easeInQuad, duration: Duration(milliseconds: 300));
                                
                                //_page.jumpToPage(1);
                          },
                        ),
                        //Padding(padding: EdgeInsets.all(1)),
                        SizedBox(height: 25,),
                      ],
                    ),
                  ),
                ),

                /*ListTile(
                  leading: Icon(OMIcons.dataUsage, color: Colors.deepOrange, size: 30,),
                  title: Text('Challenges', style: TextStyle(fontSize: 22, color: Colors.black),),
                  //subtitle: Text('swipe right', style: TextStyle(fontSize: 16, color: Colors.black, ),),
                  // subtitle: Text(DateFormat("dd-MM-yyyy").format(DateTime.now()),),
                  trailing: Icon(Icons.keyboard_arrow_right, size: 50), onTap: (){},
                ), */

              ],
            )
            ,),
          //getNoteListView(),
          Scaffold(
            body:Container(
                    child: getNoteListView(),
                    color: Colors.grey[50],
                  ),
            floatingActionButton:FloatingActionButton(
                     onPressed: () {
                      debugPrint('FAB clicked');
                      navigateToDetail(Note('', '', 2, false), 'Add Note');
                    },
                    tooltip: 'Add Note',
                    child: Icon(Icons.add),
                ),   
          )
          
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
      backgroundColor: Colors.white,//Color(0xFFEEEEEE),
      //getNoteListView(),
    );
  }
  Widget makeItem({image, title}) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover
            )
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
                    Colors.black.withOpacity(.8),
                    Colors.black.withOpacity(.2),
                  ]
              )
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(title, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
  ListView getNoteListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          //color: Color(0xFF333366),
         color: this.noteList[position].cardColor,
         //color: Color.fromRGBO(99, 138, 223, 1.0),
         //color: Color.fromRGBO(111, 194, 173, 1.0),
          elevation: 4.0,
          child: ListTile(
            contentPadding: EdgeInsets.all(15.0),
            leading: CircleAvatar(
              backgroundColor: getPriorityColor(this.noteList[position].priority),
              child: getPriorityIcon(this.noteList[position].priority),
            ),
            title: Text(this.noteList[position].title, style: titleStyle,),
            subtitle: Text(this.noteList[position].date),
            trailing: //GestureDetector(
              Checkbox(activeColor:Colors.green ,value: this.noteList[position].isChecked, onChanged: (value){
                setState(() {
                   this.noteList[position].isChecked = value;
                   if(value){
                     this.noteList[position].cardColor= Color.fromRGBO(111, 194, 173, 1.0);
                   }else
                   {
                     this.noteList[position].cardColor= Colors.white; //Color.fromRGBO(231, 129, 109, 1.0);
                   }
                  
                  debugPrint('checkboxclicked');
                });
                  
              },),
              //Icon(Icons.check_box, color: Colors.grey,),
              
              
              //onTap: () {
               // _delete(context, noteList[position]);
              //},
            //),
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
        return Colors.blueGrey;
        break;
      case 2:
        return Colors.blue;
        break;

      default:
        return Colors.blue;
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