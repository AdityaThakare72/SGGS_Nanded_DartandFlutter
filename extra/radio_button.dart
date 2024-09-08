import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHome());
  }
}

class MyHome extends StatefulWidget {
  State<MyHome> createState() => _HomeState();
}

class _HomeState extends State<MyHome> {
  String? gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Radio Buttons'), backgroundColor: Colors.orangeAccent),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(children: <Widget>[
          Text(
            'Select your Gender:',
            style: TextStyle(fontSize: 18),
          ),
          Divider(),
          ListTile(
            title: Text('Male'),
            leading: Radio(
              value: 'male',
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
            ),
          ),
          ListTile(
            title: Text('Female'),
            leading: Radio(
              value: 'female',
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
            ),
          ),
          ListTile(
            title: Text('Others'),
            leading: Radio(
              value: 'others',
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
            ),
          )
        ]),
      ),
    );
  }
}
