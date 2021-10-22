import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color generatedColor = Colors.white;

  void generateRandomColor() {
    int randomNumber = Random().nextInt(16777217);

    var hex = randomNumber.toRadixString(16);
    var colorHexString = "0xff$hex";
    var colorInteger = int.parse(colorHexString);

    setState(() {
      generatedColor = Color(colorInteger);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hey there'),
      ),
      body: InkWell(
        onTap: () {
          generateRandomColor();
        },
        child: Container(
          color: generatedColor,
          child: Center(
            child: Text(
              'Hey there \n$generatedColor',
            ),
          ),
        ),
      ),
    );
  }
}
