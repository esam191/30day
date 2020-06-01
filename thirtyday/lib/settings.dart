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
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 4.0,
             margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.lock_outline, color: Colors.blueAccent,),
                    title: Text("Change Username"),
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
                    leading: Icon(Icons.date_range, color: Colors.blueAccent,),
                    title: Text("Change Date Format"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Text('Notification Settings', style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),),
            SwitchListTile(
              value: true,
              title: Text("Task Reminders"),
              onChanged: (val){},
            ),
            SwitchListTile(
              value: true,
              title: Text("Sounds"),
              onChanged: (val){},
            ),
            SwitchListTile(
              value: false,
              title: Text("Newsletters"),
              onChanged: null,
            ),
            SwitchListTile(
              value: true,
              title: Text("App Updates"),
              onChanged: (val){},
            ),
          ],

        ),
      ),
    );


  }

}