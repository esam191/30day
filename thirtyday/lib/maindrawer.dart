import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.black87,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only( top: 30, bottom: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(''), fit: BoxFit.fill),
                      )
                    ),
              Text(
                'Firstname Lastname',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white
                ),
              ),
              Text(
                'username',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white
                ),
              ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Profile',
              style: TextStyle( fontSize: 18,),
            ),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.toys),
            title: Text(
              'Badges',
              style: TextStyle( fontSize: 18,),
            ),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Settings',
              style: TextStyle( fontSize: 18,),
            ),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text(
              'Profile',
              style: TextStyle( fontSize: 18,),
            ),
            onTap: null,
          )
        ],
      ),
    );
  }

}