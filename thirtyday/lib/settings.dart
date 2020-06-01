import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AppSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Settings', style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 4.0,
              margin: const EdgeInsets.fromLTRB(26.0, 20.0, 26.0, 20.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.lock_outline, color: Colors.blueAccent,),
                    title: Text("Change Password"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){},
                  ),
                  ListTile(
                    leading: Icon(Icons.language, color: Colors.blueAccent,),
                    title: Text("Change Language"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){},
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on, color: Colors.blueAccent,),
                    title: Text("Change Location"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){},
                  ),
                ],
              ),
            )
          ],

        ),
      ),
    );


  }

}