import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/text_show_up.dart';

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
      body: InkWell(
        onTap: () {
          generateRandomColor();
        },
        child: Container(
          color: generatedColor,
          child: Center(
            child: TextShowUp(
              child: Text(
                'Hey there',
                style: GoogleFonts.oswald(
                  textStyle: Theme.of(context).textTheme.headline5,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              delay: const Duration(seconds: 1).inMilliseconds,
            ),
          ),
        ),
      ),
    );
  }
}
