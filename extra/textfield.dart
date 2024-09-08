import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  // Create the classes for text input from textfields
  TextEditingController uname = new TextEditingController();
  TextEditingController passw = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(title: Text("Simple Text Field")),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                      controller: uname,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'User Name',
                          hintText: 'Enter your name here:')),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                      controller: passw,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter your password here:')),
                ),
                RaisedButton(
                    color: Colors.amber,
                    textColor: Colors.black,
                    child: Text('Sign In'),
                    onPressed: () {
                      if (uname.text == 'admin' && passw.text == 'admin123')
                        print('Authentication Success');
                      else
                        print('Authentication FAILED');
                    })
              ],
            ))));
  }
}
