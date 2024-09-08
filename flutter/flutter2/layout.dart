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
      body: Container(
        // take padding after color and child
        // padding -> inside space of container
        padding: EdgeInsets.all(20.0),
        // for symmetric(horizontal: 30.0,vertical: 10.0)
        // for fromLTRB(10.0,20.0,30.0,40.0)
        margin: EdgeInsets.all(10.0),
        color: Colors.grey, // background colour of container
        child: Text('Hello'),
        // when we r adding child container taking the size of this text
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red[600],
        child: Text('click'),
      ),
    );
  }
}
