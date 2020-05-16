import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
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
              title: "30Day Challenge App",
              body: "Click to create a profile",
              image: Center(
                child: Image.network("https://drive.google.com/file/d/1JHK7K-GpJZLLz_w58TIf4En366WnR8oo/view?usp=sharing", height: 175.0),
              ),
            ),
            PageViewModel(
              title: "Complete 30Day Challenge and earn rewards!",
              body: "W",
              image: const Center(child: Icon(Icons.android)),
              footer: RaisedButton(
                onPressed: () {
                  // On button presed
                },
                child: const Text("Let's Go !"),
              ),
            ),
              PageViewModel
              (
                title: "Title of first page",
                bodyWidget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Click on "),
                  Icon(Icons.edit),
                  Text(" to edit a post"),
                  ],
                ),
                image: const Center(child: Icon(Icons.android)),
              ), 
          ],
          onDone: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ThirtyDay()),
            );
          },
          onSkip: (){
              
          },
          showSkipButton: true,
          skip: const Icon(Icons.skip_next),
          next: const Icon(Icons.navigate_next),
          done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        ),
        /*FlatButton(
          color: Colors.blue,
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
        */
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
            color: Colors.indigo,
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
                alignment: Alignment(-.75, -.9),
                child: Text(
                    'Challenges', style: TextStyle(color: Colors.black, fontSize: 25),
                ),
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