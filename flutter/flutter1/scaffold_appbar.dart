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
          // what text is shown at title of app bar
        ),
        // what content will go inside the body
        // center widget centralizes whateven nested in there
        // we always have to have properties inside widget
        // thus u cant directly put text in center(noramlly child
        // property)
        body: Center(
          child: Text('Hello Rio'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Adding functionality here
            print('hello rio');
          },
          child: Icon(Icons.add),
        ),
      ),
    ));
