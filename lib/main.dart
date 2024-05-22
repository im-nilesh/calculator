import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
                children: <Widget>[
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
                calcbutton("+/-", const Color.fromARGB(255, 239, 52, 52),
                    Colors.black),
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
                //this is button zero
                ElevatedButton(
                  onPressed: () {
                    calculation('0');
                  },
                  child: const Text(
                    '0',
                    style: TextStyle(
                      fontSize: 35,
                      color: Color.fromARGB(255, 239, 52, 52),
                    ),
                  ),
                ),
                calcbutton(
                    '.', const Color.fromARGB(255, 239, 52, 52), Colors.white),
                calcbutton(
                    '=', const Color.fromARGB(255, 239, 52, 52), Colors.white),
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
      } else if (preOpr == 'X') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult == div();
      }
    } else if (btntxt == '+' ||
        btntxt == '-' ||
        btntxt == 'X' ||
        btntxt == '/' ||
        btntxt == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        setState(() {
          finalResult = add();
        });
      } else if (opr == '-') {
        setState(() {
          finalResult = sub();
        });
      } else if (opr == 'X') {
        setState(() {
          finalResult = mul();
        });
      } else if (opr == '/') {
        setState(() {
          finalResult = div();
        });
      }
      preOpr = opr;
      opr = btntxt;
      result = '';
    } else if (btntxt == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (btntxt == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btntxt == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btntxt;
      finalResult = result;
    }
    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }
}
