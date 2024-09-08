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
          title: Text('My buttons'),
        ),
        body: Center(
          child: Column(children: <Widget>[
            Container(
              margin: const EdgeInsets.all(25),
              child: TextButton(
                child: const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {},
              ),
            ),
            Container(
              margin: const EdgeInsets.all(25),
              width: 200,
              height: 50,
              color: Colors.black,
              child: ElevatedButton(
                child: const Text(
                  'Login Now',
                  style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                ),
                onPressed: () {},
              ),
            )
          ]),
        ),
      ),
    );
  }
}
