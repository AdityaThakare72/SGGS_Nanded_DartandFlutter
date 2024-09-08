import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Alert Dialog',
      home: Scaffold(
        appBar: AppBar(title: const Text('Alert Dialog')),
        body: MyAlert(),
      ),
    );
  }
}

class MyAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25),
      child: ElevatedButton(
        child: Text('Show Alert'),
        onPressed: () {
          showAlertDialog(context);
        },
      ),
    );
  }
}

void showAlertDialog(BuildContext context) {
  Widget ok = TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text('OK'));

  AlertDialog alert = AlertDialog(
    actions: [ok],
    title: const Text('Sample Alert'),
    content: const Text('This is first alert message'),
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
