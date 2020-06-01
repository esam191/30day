import 'package:flutter/material.dart';

class SignUp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
        body: Padding(
          padding: EdgeInsets.fromLTRB(40, 200, 40, 200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Start tracking.", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 40.0, color: Colors.white),),
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
                              child: Text('SIGN UP'),
                            ) ,
                          ),
                        )
                    )
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}