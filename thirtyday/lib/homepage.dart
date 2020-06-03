import 'package:flutter/material.dart';
import 'package:thirtyday/drawer.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
//import 'package:flutter/src/rendering/box.dart';
class Challenge extends StatefulWidget{
  @override
  ChallengeState createState() => ChallengeState();
}
class ChallengeState extends State<Challenge> {
  final PageController _page = PageController(initialPage: 0);
  final _challenges = <Card>[];
  int _counter  = 1;
  @override
  Widget build(BuildContext context) {
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
                        createListFromChallenge(),
                        
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
                    setState(() {
                      _challenges.add(makeNewChallenge("aaaa"));
                      _counter++;
                    });
                  },
                  child: Icon(OMIcons.add, color: Colors.black54,)
              )
              ,)
        ),
      );
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
  /*
  @override
     void initState() {
        super.initState();
        // Here initialize the list in case it is required
        _challenges.add(
          makeNewChallenge("TITLE 1"),
        );
        _challenges.add(
          makeNewChallenge("TITLE 2"),
      );
  }
  Widget createListFromChallenge(){
    return Container(
      child: ListView(
        children: <Widget>[
            Column(
              children: this._challenges,
            )
        ]
      ,)
    ,);
  }
  */
  Widget createListFromChallenge(){
    return Column(children: this._challenges,);
  }
}