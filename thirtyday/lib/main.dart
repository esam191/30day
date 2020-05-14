import 'package:flutter/material.dart';
void main() => runApp(ThirtyDayApp());

class ThirtyDayApp extends StatelessWidget{
  static final IconButton _settings = IconButton(icon: const Icon(Icons.settings),
    /// This code explains what happens when you press setting Icon.
    tooltip: 'Open settings route',
    onPressed: (){
      /// TODO: Go to settings
    },
  );
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
    tooltip: 'Share with community',
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
        appBar: AppBar(
          title: Text('30Day'),
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.menu), onPressed: (){
            print("Clicked");
          },),
          actions: appBarButtons,
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.lightBlue, 
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

