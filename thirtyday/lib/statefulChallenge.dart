import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class Challenge extends StatefulWidget{
  @override
  ChallengeState createState() => ChallengeState();
}
class ChallengeState extends State<Challenge> {
  final challenges = <Card>[];
  @override
  Widget build(BuildContext context) {
    return makeNewChallenge("Title");
  }
  @override
     void initState() {
        super.initState();
        // Here initialize the list in case it is required
        challenges.add(
          makeNewChallenge("TITLE 1"),
        );
        challenges.add(
          makeNewChallenge("TITLE 2"),
      );
  }
  Card makeNewChallenge(String title){
      return new Card(elevation: 1,
                  margin:  EdgeInsets.all(5),
                 child: ListTile(
                    //title: Text(title),
                    leading: Text('2'),
                    title: Text('Sleep 8 hours') ,
                    subtitle: Text('12/30 days completed.'),
                    trailing: Icon(OMIcons.checkBox),
                    onTap: () {},
                  )
              ,);
  }
  /*
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
}