import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MySlider(),
    );
  }
}

class MySlider extends StatefulWidget {
  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double _value = 40.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Slider')),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Center(
            child: Row(
          children: <Widget>[
            Icon(
              Icons.volume_up,
              size: 40,
            ),
            Expanded(
              child: Slider(
                value: _value.toDouble(),
                onChanged: (double newvalue) {
                  setState(() {
                    _value = newvalue;
                  });
                },
                min: 0.0,
                max: 100.0,
                divisions: 10,
                activeColor: Colors.orange,
                inactiveColor: Colors.grey,
                label: 'Set your volume',
                semanticFormatterCallback: (double newvalue) {
                  return ('$newvalue');
                },
              ),
            )
          ],
        )),
      ),
    );
  }
}
