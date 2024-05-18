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
          // Handle button press
        },
        child: Text(
          btntxt,
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
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //display
            const SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '12345',
                      textAlign: TextAlign.left,
                      style: TextStyle(
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
                    "x", const Color.fromARGB(255, 239, 52, 52), Colors.black),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
