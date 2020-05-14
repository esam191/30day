import 'package:flutter/material.dart';
void main() => runApp(ThirtyDayApp());

class ThirtyDayApp extends StatelessWidget {
  final PageController _page = PageController(initialPage: 0);
  static final IconButton _settings = IconButton(icon: const Icon(Icons.settings),
    tooltip: 'Open settings route',
    onPressed: (){
    },);
  final List<Widget> appBarButtons = [_settings,];
  static final IconButton _home = IconButton(icon: const Icon(Icons.home), iconSize: 30.0, padding: EdgeInsets.only(left: 28.0),
    tooltip: 'Go to home',
    onPressed: (){
    },
  );
  static final IconButton _share = IconButton(icon: const Icon(Icons.share), iconSize: 30.0, padding: EdgeInsets.only(right: 28.0),
    tooltip: 'Share with community',
    onPressed: (){
    },
  );
  static final IconButton _profile = IconButton(icon: const Icon(Icons.face), iconSize: 30.0, padding: EdgeInsets.only(left: 28.0),
    tooltip: 'profile ',
    onPressed: (){
    },
  );
  static final IconButton _calendar = IconButton(icon: const Icon(Icons.calendar_today), iconSize: 30.0, padding: EdgeInsets.only(right: 28.0),
    tooltip: 'Share with community',
    onPressed: (){
    },
  );
  final List<Widget> bottomAppBarButtons = [_home, _share, _profile, _calendar];

  @override
  Widget build(BuildContext context) {
    var mainApp = MaterialApp(
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: AppBar(
          title: Text('30Day'),
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.menu), onPressed: (){
            print("Clicked");
          },color: Colors.black,),
          elevation: 10,
          actions: appBarButtons,
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue, 
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 50,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: bottomAppBarButtons,
            ),
          )

        ),
        body: PageView(
          controller: _page,
          onPageChanged: (int) {
            print('Page Changes to index $int');
          },
          children: <Widget>[
            Center(
              child: Container(
                child: Text('Empty Body 0'),
              ),
            ),
            
            /*
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
              onPressed: (){
              },
              child: Icon(Icons.add, color: Colors.black,)
            )
            ,)
        ),
      )
    ,);
    return mainApp;
  }
}




/*
void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text('30Day'),
      centerTitle: true,
    ),
    body: Center(
      child: Text('start a new challenge'),
    ),
    floatingActionButton: FloatingActionButton(
      child: Text('+'),
    ),
  )
));
*/

