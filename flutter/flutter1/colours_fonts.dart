import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      // appbar will specify how its gonna look at top
      // widgets starting with capital later
      // home and appbar are properties and inside them
      // are our widgets. AppBar(properties)

      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
          centerTitle: true,
          backgroundColor: Colors.red[600],
          // what text is shown at title of app bar
        ),
        // what content will go inside the body
        // center widget centralizes whateven nested in there
        // we always have to have properties inside widget
        // thus u cant directly put text in center(noramlly child
        // property)
        body: Center(
          child: Text(
            'hello rio',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.grey[600],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Text('click'),
          backgroundColor: Colors.red[600],
        ),
      ),
    ));
