import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text('30Day'),
      centerTitle: true,
    ),
    body: Center(
      child: Text('start a new challenge'),
    ),
    floatingActionButton: FloatingActionButton(
      child: Text('+'),
    ),
  )
));


