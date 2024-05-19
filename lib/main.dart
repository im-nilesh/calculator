import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  dynamic displaytxt = 20;
  //Button Widget
  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: () {
          calculation(btntxt);
        },
        child: Text(
          '$btntxt',
          style: TextStyle(fontSize: 35, color: txtcolor),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: btncolor, // Button background color
          shape: const CircleBorder(), // Circular shape
          padding: const EdgeInsets.all(25), // Padding inside the button
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.black,
        titleTextStyle: const TextStyle(
            color: Color.fromARGB(166, 109, 134, 245), fontSize: 25),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //display
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '$text',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.cyanAccent,
                        fontSize: 100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton(
                    "AC", const Color.fromARGB(255, 239, 52, 52), Colors.black),
                calcbutton(
                    "C", const Color.fromARGB(255, 239, 52, 52), Colors.black),
                calcbutton(
                    "%", const Color.fromARGB(255, 239, 52, 52), Colors.black),
                calcbutton(
                    "/", const Color.fromARGB(255, 239, 52, 52), Colors.black),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton(
                    "7", const Color.fromARGB(255, 239, 52, 52), Colors.black),
                calcbutton(
                    "8", const Color.fromARGB(255, 239, 52, 52), Colors.black),
                calcbutton(
                    "9", const Color.fromARGB(255, 239, 52, 52), Colors.black),
                calcbutton(
                    "X", const Color.fromARGB(255, 239, 52, 52), Colors.black),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton(
                    "4", const Color.fromARGB(255, 239, 52, 52), Colors.black),
                calcbutton(
                    "5", const Color.fromARGB(255, 239, 52, 52), Colors.black),
                calcbutton(
                    "6", const Color.fromARGB(255, 239, 52, 52), Colors.black),
                calcbutton(
                    "-", const Color.fromARGB(255, 239, 52, 52), Colors.black),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton(
                    "1", const Color.fromARGB(255, 239, 52, 52), Colors.black),
                calcbutton(
                    "2", const Color.fromARGB(255, 239, 52, 52), Colors.black),
                calcbutton(
                    "3", const Color.fromARGB(255, 239, 52, 52), Colors.black),
                calcbutton(
                    "+", const Color.fromARGB(255, 239, 52, 52), Colors.black),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton(
                    "0", const Color.fromARGB(255, 239, 52, 52), Colors.black),
                calcbutton(
                    ".", const Color.fromARGB(255, 239, 52, 52), Colors.black),
                calcbutton(
                    "?", const Color.fromARGB(255, 239, 52, 52), Colors.black),
                calcbutton(
                    "=", const Color.fromARGB(255, 239, 52, 52), Colors.black),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';

  void calculation(btntxt) {
    if (btntxt == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btntxt == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult == div();
      }
    } else if (btntxt == '+' ||
        btntxt == '-' ||
        btntxt == 'x' ||
        btntxt == '/' ||
        btntxt == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult == sub();
      } else if (opr == 'x') {
        finalResult == mul();
      } else if (opr == '/') {
        finalResult == div();
      }
      preOpr = opr;
      opr = btntxt;
      result = '';
    }
  }

  String add() {
    return '1';
  }

  String sub() {
    return '1'; //comment
  }

  String mul() {
    return '1';
  }

  String div() {
    return '1';
  }
}
