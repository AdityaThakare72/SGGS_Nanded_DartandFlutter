import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Calculator'),
        ),
        body: Calculator(),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  State createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String answer = 'Your answer is: ';
  var firstnum = TextEditingController();
  var secondnum = TextEditingController();
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: firstnum,
              decoration: InputDecoration(
                  labelText: 'First Number', hintText: 'Enter number here'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: secondnum,
              decoration: InputDecoration(
                  labelText: 'Second Number', hintText: 'Enter number here'),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      calculation("+");
                    },
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 30),
                    )),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      calculation("-");
                    },
                    child: Text(
                      "-",
                      style: TextStyle(fontSize: 30),
                    )),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      calculation("*");
                    },
                    child: Text(
                      "*",
                      style: TextStyle(fontSize: 30),
                    )),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      calculation("/");
                    },
                    child: Text(
                      "/",
                      style: TextStyle(fontSize: 30),
                    )),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  answer,
                  style: TextStyle(fontSize: 25),
                ))
          ],
        ));
  }

  void calculation(String value) {
    int valueOne = int.parse(firstnum.text.toString());
    int valueTwo = int.parse(secondnum.text.toString());
    switch (value) {
      case "+":
        int value = valueOne + valueTwo;
        setState(() {
          answer = "Your answer is " + value.toString();
        });
        break;
      case "-":
        int value = valueOne - valueTwo;
        setState(() {
          answer = "Your answer is " + value.toString();
        });
        break;
      case "*":
        int value = valueOne * valueTwo;
        setState(() {
          answer = "Your answer is " + value.toString();
        });
        break;
      case "/":
        double valueOne = double.parse(firstnum.text.toString());
        double valueTwo = double.parse(secondnum.text.toString());
        double value = valueOne / valueTwo;
        setState(() {
          answer = "Your answer is " + value.toString();
        });
        break;
      default:
        print("NO");
    }
  }
}
