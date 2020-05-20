import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:intl/intl.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:thirtyday/maindrawer.dart';

void main(){
  runApp(MaterialApp(
    home: ThirtyDayApp(),
    routes: <String, WidgetBuilder> {
      "/SecondPage": (BuildContext context) => ThirtyDay(),
      "/IntroPage": (BuildContext context) => ThirtyDayApp(),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: AppBar(
          title: Text('30Day', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          /*
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
          */
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
                /*
                Expanded(child:  
                    Opacity(opacity: 0.0,
                          child: IconButton(icon: const Icon(OMIcons.face),
                          color: Colors.black54,
                          iconSize: 30.0,
                          //padding: EdgeInsets.only(left: 28.0),
                          tooltip: 'Go to profile',
                          onPressed: () {},
                        )
                    ,)
                    
                ,)
                */
                ],
              ),
            )
        ),
        backgroundColor: Color(0xFFEEEEEE),
        body: PageView(
          controller: _page,
          onPageChanged: (int) {
            print('Page Changes to index $int');
          },
          children: <Widget>[    // main container
            Container(               
              child: ListView( 
                children: <Widget>[
                  Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 5),),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Card(
                        elevation: 40,
                        color: Color(0xFF1E88E5),
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
                            Padding(padding: EdgeInsets.all(30)),
                          ],
                        ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(20, 20, 0, 5),
                  child: Text('Challenges', style: TextStyle(fontSize: 20, fontWeight:FontWeight.w700 ),),
                  ),
                  Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Color(0xFFF5F5F5),
                    elevation: 10,
                    //shadowColor: ,
                    child: ListTile(
                        leading: Text('1'),
                        title: Text('Run 10 miles') ,
                        subtitle: Text('22/30 days completed.'),
                        trailing: Icon(OMIcons.checkBox),
                      onTap: () {},
                        ),
                   margin:  EdgeInsets.all(5),
                      ),
                  Card(
                    color: Color(0xFFF5F5F5),
                    elevation: 10,
                    child: ListTile(
                      leading: Text('2'),
                      title: Text('Sleep 8 hours') ,
                      subtitle: Text('12/30 days completed.'),
                      trailing: Icon(OMIcons.checkBox),
                      onTap: () {},
                    ),
                   margin:  EdgeInsets.all(5),
                  ),
                  Card(
                    color: Color(0xFFF5F5F5),
                    elevation: 10,
                    child: ListTile(
                      leading: Text('3'),
                      title: Text('Pushups') ,
                      subtitle: Text('4/30 days completed.'),
                      trailing: Icon(OMIcons.checkBox),
                      onTap: () {},
                    ),
                    margin: EdgeInsets.all(5) ,
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


