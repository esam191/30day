import 'dart:async';
import 'package:flutter/material.dart';
import 'package:thirtyday/challenges.dart';
import 'package:thirtyday/database_helper.dart';
import 'package:thirtyday/todo_detail.dart';
import 'package:sqflite/sqflite.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:thirtyday/drawer.dart';

class TodoList extends StatefulWidget {
   @override
  TodoListState createState() => TodoListState();
  /*
  @override
  State<StatefulWidget> createState() {
    return TodoListState();
  }*/
}
class TodoListState extends State<TodoList> {
  final PageController _page = PageController(initialPage: 0);
  //final _challenges = <Card>[];
  //int _counter  = 1;
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Challenge> todoList;
  int count = 0;

  ListView getTodoListView() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.amber,
              child: Text(getFirstLetter(this.todoList[position].title),
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            title: Text(this.todoList[position].title,
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(this.todoList[position].description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  child: Icon(Icons.delete,color: Colors.red,),
                  onTap: () {
                    _delete(context, todoList[position]);
                  },
                ),
              ],
            ),
            onTap: () {
              debugPrint("ListTile Tapped");
              navigateToDetail(this.todoList[position], 'Edit Todo');
            },
          ),
        );
      },
    );
  }

  getFirstLetter(String title) {
    return title.substring(0, 2);
  }

  void _delete(BuildContext context, Challenge todo) async {
    int result = await databaseHelper.deleteTodo(todo.id);
    if (result != 0) {
      _showSnackBar(context, 'Todo Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(Challenge todo, String title) async {
    bool result =
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return TodoDetail(todo, title);
    }));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Challenge>> todoListFuture = databaseHelper.getTodoList();
      todoListFuture.then((todoList) {
        setState(() {
          this.todoList = todoList;
          this.count = todoList.length;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (todoList == null) {
      todoList = List<Challenge>();
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
                              Navigator.pop(context); // MOVE this to settings--logout
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
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  )
              ),
              backgroundColor: Colors.white,//Color(0xFFEEEEEE),
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
                        Padding(padding: EdgeInsets.fromLTRB(20, 20, 0, 5),
                                child: Text('Challenges', style: TextStyle(fontSize: 15, fontFamily: 'Proxima Sans'),),
                                ),          
                ],
              )
              ,),
              getTodoListView()
              //Container(child: getTodoListView(),),
          ],
        ),
        floatingActionButton: Container(
            height: 65.0,
            width: 65.0,
            child: FittedBox(
              child: FloatingActionButton(
                  tooltip: 'Add a new challenge',
                  //backgroundColor: Colors.blueAccent[50],
                  onPressed: () {  
                    setState(() {
                      //_challenges.add(makeNewChallenge("aaaa"));
                      //_counter++;
                                debugPrint('FAB clicked');
                        navigateToDetail(Challenge('', '', ''), 'Add Todo');
                    });
                  },
                  child: Icon(OMIcons.add, color: Colors.black54,)
              )
              ,)
        ),
      );
  }
  /*
    return Scaffold(
      appBar: AppBar(
        title: Text('30day'),
      ),
      body: getTodoListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
          navigateToDetail(Challenge('', '', ''), 'Add Todo');
        },
        tooltip: 'Add Todo',
        child: Icon(Icons.add),
      ),
    );
    
  }
  Widget createListFromChallenge(){
    return Column(children: this._challenges,);
  }
  Card makeNewChallenge(String title){
      return new Card(elevation: 1,
                  margin:  EdgeInsets.all(5),
                 child: ListTile(
                    //title: Text(title),
                    leading: Text('$_counter'),
                    title: Text('Sleep 8 hours') ,
                    subtitle: Text('12/30 days completed.'),
                    trailing: Icon(OMIcons.checkBox),
                    onTap: () {},
                  )
              ,);
  }
  */

  


}