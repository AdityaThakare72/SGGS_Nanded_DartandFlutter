import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fill my form',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fill the form'),
        ),
        body: MyForm(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  Widget build(BuildContext context) {
    return (Form(
      child: Column(children: <Widget>[
        TextFormField(
          decoration: InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Enter your name',
              labelText: 'Name'),
        ),
        TextFormField(
          decoration: InputDecoration(
              icon: Icon(Icons.phone),
              hintText: 'Enter your mobile',
              labelText: 'Contact'),
        ),
        TextFormField(
          decoration: InputDecoration(
              icon: Icon(Icons.calendar_today),
              hintText: 'Enter date of birth',
              labelText: 'D.O.B.'),
        ),
        Container(
          padding: EdgeInsets.only(left: 150.0, top: 40.0),
          child: ElevatedButton(
            child: Text('Submit'),
            onPressed: null,
          ),
        )
      ]),
    ));
  }
}
