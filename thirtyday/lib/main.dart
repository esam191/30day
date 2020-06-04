import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
//import 'package:intl/intl.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
//import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:thirtyday/settings.dart';
import 'package:thirtyday/signup.dart';
import 'package:thirtyday/homepage.dart';
import 'package:thirtyday/todo_list.dart';

void main() {
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
  @override
  Widget build(BuildContext context) {
      //Challenge stateChallenge;
            return TodoList();
  }
}