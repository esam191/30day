import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    home: ThirtyDayApp(),
    routes: <String, WidgetBuilder> {
      "/SecondPage": (BuildContext context) => ThirtyDay()
    }
  ));
}
class ThirtyDayApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          color: Colors.blueAccent,
          textColor: Colors.white,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          padding: EdgeInsets.all(8.0),
          splashColor: Colors.blueAccent,
          onPressed: () {Navigator.of(context).pushNamed("/SecondPage");
          },
          child: Text(
            "click to login",
            style: TextStyle(fontSize: 20.0),
          ),
        )
      )
    );
  }
}
class ThirtyDay extends StatelessWidget {
  final PageController _page = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: AppBar(
          title: Text('30Day'), backgroundColor: Colors.indigo,
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () {
            print("Clicked");
          }, color: Colors.black,),
          elevation: 10,
          actions: <Widget>[
            IconButton(icon: const Icon(Icons.settings), color: Colors.black,
              tooltip: 'Open settings route',
              onPressed: () {},)
          ],
        ),
        bottomNavigationBar: BottomAppBar(
            color: Colors.blueAccent,
            shape: CircularNotchedRectangle(),
            child: Container(
              height: 50,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //children: bottomAppBarButtons,
                children: <Widget>[
                  IconButton(icon: const Icon(Icons.home),
                    iconSize: 30.0,
                    padding: EdgeInsets.only(left: 28.0),
                    tooltip: 'Go to home',
                    onPressed: () {
                      /// Go back to login page.
                      /// TODO: put this pop inside settings 
                      Navigator.pop(context); // MOVE this to settings--logout
                    },
                  ),
                  IconButton(icon: const Icon(Icons.share),
                    iconSize: 30.0,
                    padding: EdgeInsets.only(right: 28.0),
                    tooltip: 'Go to share',
                    onPressed: () {},
                  ),
                  IconButton(icon: const Icon(Icons.face),
                    iconSize: 30.0,
                    padding: EdgeInsets.only(left: 28.0),
                    tooltip: 'Go to profile',
                    onPressed: () {},
                  ),
                  IconButton(icon: const Icon(Icons.calendar_today),
                    iconSize: 30.0,
                    padding: EdgeInsets.only(right: 28.0),
                    tooltip: 'Go to calendar',
                    onPressed: () {},
                  ),
                ],
              ),
            )

        ),
        body: PageView(
          controller: _page,
          onPageChanged: (int) {
            print('Page Changes to index $int');
          },
          children: <Widget>[
            Container(
              child: Align(
                alignment: Alignment(0.00, -.85),
                child: Text(
                    'Challenges'),
              ),
            )
            /*
            Center(
              child: Container(
                child: Text('Empty Body 0'),
              ),
            ),

            Center(
              child: Container(
                child: Text('Empty Body 1'),
              ),
            ),
            Center(
              child: Container(
                child: Text('Empty Body 2'),
              ),
            ),
            Center(
              child: Container(
                child: Text('Empty Body 3'),
              ),
            )
            */
          ],
        ),
        floatingActionButton: Container(
            height: 65.0,
            width: 65.0,
            child: FittedBox(
              child: FloatingActionButton(
                  tooltip: 'Add a new challenge',
                  onPressed: () {
                    /// TODO: add code to enter challenge
                  },
                  child: Icon(Icons.add, color: Colors.black,)

              )
              ,)
        ),
      );
  }
}
