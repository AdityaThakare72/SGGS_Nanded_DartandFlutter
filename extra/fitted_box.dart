import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fitted Box',
        theme: ThemeData(primarySwatch: Colors.green),
        home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fitted Box")),
      body: Center(
        child: FittedBox(
          child: Row(
            children: <Widget>[
              Container(
                child: Image.asset('assets/computer.png'),
              ),
              Container(child: const Text('Hello World'))
            ],
          ),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
