import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alert Dialog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController tec = TextEditingController();
  Future<void> _displayTextInputDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Textfield in Alert Dialog'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value; // valueText - local
                });
              },
              controller: tec,
              decoration: InputDecoration(hintText: 'Enter text'),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                child: Text('Cancel'),
                color: Colors.red,
                textColor: Colors.black,
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    codeDialog = valueText;
                    Navigator.pop(context);
                  });
                },
                child: Text('OK'),
                color: Colors.amberAccent,
                textColor: Colors.blue,
              )
            ],
          );
        });
  }

  String codeDialog = '';
  String valueText = '';
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Alert Dialog'),
      ),
      body: Center(
          child: FlatButton(
        child: Text('Press Here'),
        onPressed: () {
          _displayTextInputDialog(context);
        },
        textColor: Colors.blue,
        color: Colors.black26,
      )),
    );
  }
}
