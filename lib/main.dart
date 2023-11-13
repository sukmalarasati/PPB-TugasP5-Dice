import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dadidu Dadu"),
          centerTitle: true,
        ),
        backgroundColor: Colors.red,
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDice1 = 1;
  var rightDice1 = 1;
  var leftDice2 = 1;
  var rightDice2 = 1;

  void randomDice() {
    leftDice1 = Random().nextInt(6) + 1;
    rightDice1 = Random().nextInt(6) + 1;
    leftDice2 = Random().nextInt(6) + 1;
    rightDice2 = Random().nextInt(6) + 1;
  }

  Widget buildDiceButton(int diceValue) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          onPressed: () {
            setState(() {
              randomDice();
            });
          },
          child: Image.asset("images/dice$diceValue.png"),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              buildDiceButton(leftDice1),
              buildDiceButton(rightDice1),
            ],
          ),
          Row(
            children: [
              buildDiceButton(leftDice2),
              buildDiceButton(rightDice2),
            ],
          ),
        ],
      ),
    );
  }
}
