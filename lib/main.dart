import "dart:math";
import "package:flutter/material.dart";

final randomize = Random();
void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var activeDice = 'one';

  final List<String> diceFaces = ['one', 'two', 'three', 'four', 'five', 'six'];
  void roll() {
    setState(() {
      int randomNumber = randomize.nextInt(6) + 1;
      activeDice = diceFaces[randomNumber - 1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rolling Dice Game',
          style: TextStyle(
            fontSize: 28,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          MyWidget.red(),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset(
            'images/dice-six-faces-$activeDice.png',
            width: 170,
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: roll,
            child: const Text(
              "Click to Roll",
              style: TextStyle(
                fontSize: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget(
      this.color1, this.color2, this.color3, this.color4, this.color5,
      {super.key});

  const MyWidget.red({super.key})
      : color1 = Colors.yellow,
        color2 = Colors.black,
        color3 = Colors.white10,
        color4 = Colors.purple,
        color5 = Colors.indigo;
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;
  final Color color5;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2, color3, color4, color5],
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
        ),
      ),
      alignment: const FractionalOffset(.5, 0.7),
      child: Column(),
    );
  }
}
