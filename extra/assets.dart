import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('See my Image'),
          ),
          body: Center(
            child: Row(children: <Widget>[
              Image.asset('assets/dart-flutter.png'),
              //Image.asset('assets/computer.png'),
              const Text(
                'Its my Computer',
                style: TextStyle(fontSize: 25),
              )
            ]),
          )),
    );
  }
}
