import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyState createState() => new _MyState();
}

class _MyState extends State<MyApp> {
  int count = 0;

  void incrementCounter() {
    setState(() {
      count++;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Clicks'),
      ),
      body: Center(
          child: ElevatedButton(
        child: Text('Total Button Clicks $count'),
        onPressed: () {
          incrementCounter();
        },
      )),
    );
  }
}
