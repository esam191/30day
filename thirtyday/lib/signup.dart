import 'package:flutter/material.dart';

class SignUp extends StatelessWidget{
    @override
    Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding:EdgeInsets.only(right: 80.0),
                child: Text("Start tracking.", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 40.0, color: Colors.white),),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
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
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          )
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      height: 50.0,
                      child: Material(
                          borderRadius: BorderRadius.circular(30.0),
                          shadowColor: Colors.black12,
                          color: Colors.white,
                          child: GestureDetector(
                            onTap: () { Navigator.of(context).pushNamed("/SecondPage");},
                            child: Center(
                              child: Text('SIGN UP', style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold, fontSize: 16),
                              ) ,
                            ),
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}