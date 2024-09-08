import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stacked Widgets',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          alignment: Alignment.center,
          color: Colors.orangeAccent,
          child: Stack(
            children: <Widget>[
              Container(color: Colors.cyan),
              Container(color: Colors.redAccent, 
              height: 350, width: 250),
              Container(color: Colors.yellowAccent, 
              height: 200, width: 250)
            ],
          )),
    );
  }
}
