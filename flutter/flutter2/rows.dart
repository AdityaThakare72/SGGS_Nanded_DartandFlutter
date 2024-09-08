import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my first app'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // start, center, spaceBetween, end
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text('hello, world'),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(primary: Colors.blue),
            child: Text('click me'),
          ),
          Container(
              color: Colors.cyan,
              padding: EdgeInsets.all(30.0),
              child: Text('inside container')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red[600],
        child: Text('click'),
      ),
    );
  }
}
