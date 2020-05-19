import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:intl/intl.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
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
        child: IntroductionScreen(
          pages: <PageViewModel> [
              PageViewModel(
              title: "Welcome to 30Day.",
              body: "Challenge tracking so simple you'll actually use it.",
                image: Center(child: Image.asset("images/img1.png", height: 250.0)),
              decoration: const PageDecoration(
                pageColor: Colors.lightBlueAccent,
                titleTextStyle: TextStyle(fontWeight: FontWeight.w900 ,fontSize: 35.0, color: Colors.white),
                bodyTextStyle: TextStyle( fontWeight: FontWeight.w700 ,fontSize: 20.0, color: Colors.white),
              ),
            ),
            PageViewModel(
              title: "Make it a game.",
              body: "Earn rewards for every challenge you complete.",
              image: Center(child: Image.asset("images/img3.png", height: 250.0)),
                decoration: const PageDecoration(
                  pageColor: Colors.redAccent,
                  titleTextStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 40.0, color: Colors.white),
                  bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0, color: Colors.white),
                ),
            ),
              PageViewModel(
                title: "Start tracking.",
                body: "Use the '+' sign to add a new challenge once logged in.",
                image: Center(child: Image.asset("images/img2.png", height: 250.0)),
                decoration: const PageDecoration(
                  pageColor: Colors.greenAccent,
                  titleTextStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 40.0, color: Colors.white),
                  bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0, color: Colors.white),
                ),
                footer: Container(
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'USERNAME',
                          labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          )
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        height: 30.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          shadowColor: Colors.black12,
                          color: Colors.green,
                          child: GestureDetector(
                            onTap: () { Navigator.of(context).pushNamed("/SecondPage");},
                            child: Center(
                              child: Text('SIGN UP'),
                            ) ,
                          ),
                        )
                      )
                    ],
                  ),
                )

                /* GoogleSignInButton(
                  onPressed: () { },
                  splashColor: Colors.white,
                  darkMode: true,
                  // setting splashColor to Colors.transparent will remove button ripple effect.
                ) */
              ), 
          ],
          onDone: (){ Navigator.of(context).pushNamed("/SecondPage"); },
          showSkipButton: true,
          skip: const Text('SKIP'),
          next: const Icon(Icons.navigate_next),
          done: const Text("LOG IN", style: TextStyle(fontWeight: FontWeight.w600)),
        ),
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
          title: Text('30Day', style: TextStyle(color: Colors.black)), 
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(icon: Icon(OMIcons.menu, color: Colors.black),
          onPressed: () {
            //print("Clicked");
          },),
          elevation: 10,
          actions: <Widget>[
            IconButton(icon: Icon(OMIcons.settings, color: Colors.black,),
              tooltip: 'Open settings route',
              onPressed: () {},)
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
                  IconButton(icon: const Icon(OMIcons.home),
                    iconSize: 30.0,
                    padding: EdgeInsets.only(left: 28.0),
                    tooltip: 'Go to home',
                    onPressed: () {
                      /// Go back to login page.
                      /// TODO: put this pop inside settings 
                      Navigator.pop(context); // MOVE this to settings--logout
                    },
                  ),
                  IconButton(icon: const Icon(OMIcons.share),
                    iconSize: 30.0,
                    padding: EdgeInsets.only(right: 28.0),
                    tooltip: 'Go to share',
                    onPressed: () {},
                  ),
                  IconButton(icon: const Icon(OMIcons.face),
                    iconSize: 30.0,
                    padding: EdgeInsets.only(left: 28.0),
                    tooltip: 'Go to profile',
                    onPressed: () {},
                  ),
                  IconButton(icon: const Icon(OMIcons.calendarToday),                    
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
          children: <Widget>[    // main container
            Container(               
              child: ListView( 
                children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Card(
                        color: Colors.white60,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                             ListTile(
                              leading: Icon(OMIcons.whatshot, color: Colors.deepOrange,),
                              title: Text('Challenges'),
                              //subtitle: Text('Welcome to the 30Day. '),
                              subtitle: Text(DateFormat("dd-MM-yyyy").format(DateTime.now()),
                            ),

                            /*
                            ButtonBar(
                              children: <Widget>[
                                FlatButton(
                                  child: const Text('BUY '),
                                  onPressed: () {/* ... */},
                                ),
                                FlatButton(
                                  child: const Text('LISTEN'),
                                  onPressed: () {/* ... */},
                                ),
                              ],
                            ),
                            */
                             ),
                          ],
                        ),
                    ),
                  ),
                  
                  Card(
                    color: Colors.white70,
                    child: ListTile(
                        leading: Text('1'),
                        title: Text('Todo ') ,
                        subtitle: Text('Run 10 miles'),
                        trailing: Icon(OMIcons.checkBox),
                        isThreeLine: true,
                        ),
                      ),
                  Card(
                    color: Colors.white70,
                      child: ListTile(
                        leading: Text('2'),
                        title: Text('challenge') ,
                        subtitle: Text('Sleep 8 hours'),
                        trailing: Icon(OMIcons.checkBox),
                        isThreeLine: true,
                        ),
                      )



                ],
              )

              /*
              ListWheelScrollView.useDelegate(
                  itemExtent: 100.0,
                  clipToSize: true,
                
                  childDelegate:ListWheelChildLoopingListDelegate(children: const <Widget> [
                  Card(child: ListTile(
                        leading: FlutterLogo(size: 72.0),
                        title: Text('Three-line ListTile'),
                        subtitle: Text('A sufficiently long subtitle warrants three lines.'),
                        trailing: Icon(Icons.more_vert),
                        isThreeLine: true,
                        ),
                      )
                  ])
                 ,)
                 */
              ,)
          ],
        ),
        floatingActionButton: Container(
            height: 65.0,
            width: 65.0,
            child: FittedBox(
              child: FloatingActionButton(
                  
                  tooltip: 'Add a new challenge',
                  backgroundColor: Colors.white,
                  onPressed: () {
                    /// TODO: add code to enter challenge
                  },
                  child: Icon(OMIcons.add, color: Colors.black,)

              )
              ,)
        ),
      );
  }
}


