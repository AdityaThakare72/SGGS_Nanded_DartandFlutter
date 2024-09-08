import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flatbutton Event'),
        ),
        body: Center(
          child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.all(25),
              child: TextButton(
                child: Text(
                  'Sign up',
                  style: TextStyle(fontSize: 20, backgroundColor: Colors.black),
                ),
                onPressed: () {
                  print('You pressed signup button');
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: TextButton(
                child: Text(
                  'Login Now',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  print('You can login now');
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
