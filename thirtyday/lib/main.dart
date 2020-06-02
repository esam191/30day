import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
//import 'package:intl/intl.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
//import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:thirtyday/maindrawer.dart';
import 'package:thirtyday/settings.dart';
import 'package:thirtyday/signup.dart';
import 'package:thirtyday/statefulChallenge.dart';
void main(){
  runApp(MaterialApp(
    home: AppIntro(),
    routes: <String, WidgetBuilder> {
      "/SecondPage": (BuildContext context) => ThirtyDay(),
      "/IntroPage": (BuildContext context) => AppIntro(),
      "/SettingsPage": (BuildContext context) => AppSettings(),
      "/SignupPage": (BuildContext context) => SignUp(),
    }
  ));
}
class AppIntro extends StatelessWidget{
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
                title: "List challenges.",
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
                              child: Text('LOG IN'),
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
          onDone: (){ Navigator.of(context).pushNamed("/SignupPage"); },
          showSkipButton: true,
          skip: const Text('SKIP'),
          next: const Icon(Icons.navigate_next),
          done: const Text("SIGN UP", style: TextStyle(fontWeight: FontWeight.w600)),
        ),
      )
    );
  } 
}
class ThirtyDay extends StatelessWidget {
  final PageController _page = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
      Challenge stateChallenge;
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
                        stateChallenge = Challenge(),
                ],
              )
              ,),
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
                  },
                  child: Icon(OMIcons.add, color: Colors.black54,)
              )
              ,)
        ),
      );
  }
}