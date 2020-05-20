import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

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
            color: Color(0xFF1E88E5),
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
                        image: NetworkImage('https://www.searchpng.com/wp-content/uploads/2019/02/Deafult-Profile-Pitcher.png'), fit: BoxFit.fill),
                      )
                    ),
              Text(
                'Firstname Lastname',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black
                ),
              ),
              Text(
                'username',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black
                ),
              ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(OMIcons.person),
            title: Text(
              'Profile',
              style: TextStyle( fontSize: 18,),
            ),
            onTap: null,
          ),
          ListTile(
            leading: Icon(OMIcons.stars),
            title: Text(
              'Badges',
              style: TextStyle( fontSize: 18,),
            ),
            onTap: null,
          ),
          ListTile(
            leading: Icon(OMIcons.settings),
            title: Text(
              'Settings',
              style: TextStyle( fontSize: 18,),
            ),
            onTap: null,
          ),
          ListTile(
            leading: Icon(OMIcons.arrowBack),
            title: Text(
              'Log Out',
              style: TextStyle( fontSize: 18,),
            ),
            onTap: () { Navigator.of(context).pushNamed("/IntroPage");},
          )
        ],
      ),
    );
  }

}