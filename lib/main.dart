import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  buttonPressed(String btnTxt) {
    if (btnTxt == "CLEAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (btnTxt == "+" ||
        btnTxt == "-" ||
        btnTxt == "X" ||
        btnTxt == "/") {
      num1 = double.parse(output);
      operand = btnTxt;
      _output = "0";
    } else if (btnTxt == ".") {
      if (_output.contains(".")) {
        print("Already Contains Decimal");
        return;
      } else {
        _output = _output + btnTxt;
      }
    } else if (btnTxt == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      } else if (operand == "-") {
        _output = (num1 - num2).toString();
      } else if (operand == "X") {
        _output = (num1 * num2).toString();
      } else if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = num2 = 0.0;
      operand = "";
    } else {
      _output = _output + btnTxt;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String btnText) {
    return Expanded(
      child: new OutlineButton(
        padding: EdgeInsets.all(24.0),
        onPressed: () {
          buttonPressed(btnText);
        },
        child: Text(
          btnText,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: Column(children: <Widget>[
            Container(
              child: Text(
                output,
                style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
              ),
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              alignment: Alignment.centerRight,
            ),
            Expanded(
              child: Divider(),
            ),
            Column(children: [
              Row(children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("/"),
              ]),
              Row(children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("X"),
              ]),
              Row(children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-"),
              ]),
              Row(children: [
                buildButton("."),
                buildButton("0"),
                buildButton("00"),
                buildButton("+"),
              ]),
              Row(children: [
                buildButton("CLEAR"),
                buildButton("="),
              ]),
            ])
          ]),
        ));
  }
}
