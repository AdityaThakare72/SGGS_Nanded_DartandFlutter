import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> {
  bool valueFirst = false;
  bool valueSecond = false;
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Checkbox Demo')),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(children: <Widget>[
            SizedBox(
              width: 10,
            ),
            Text(
              'My Checkboxes',
              style: TextStyle(fontSize: 20),
            ),
            CheckboxListTile(
                value: this.valueFirst,
                title: const Text('It is first Alarm'),
                secondary: const Icon(Icons.alarm),
                onChanged: (bool? value) {
                  setState(() {
                    this.valueFirst = value ?? false;
                  });
                }),
            CheckboxListTile(
                value: this.valueSecond,
                title: const Text('It is second Alarm'),
                secondary: const Icon(Icons.alarm),
                onChanged: (bool? value) {
                  setState(() {
                    this.valueSecond = value ?? false;
                  });
                })
          ]),
        ),
      ),
    );
  }
}
