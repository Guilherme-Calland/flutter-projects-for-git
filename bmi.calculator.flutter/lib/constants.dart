import 'package:flutter/material.dart';

const double kBottomPanelHeight = 80;
const Color kBottomPanelColor = Color(0xffCF3E54);
const Color kNotActiveBoxColor = Color(0xff13193B);
const Color kActiveBoxColor = Color(0xff26294D);
const Color kNotActiveIconColor = Color(0xffB2B4C6);
const Color kActiveIconColor = Colors.white;
const TextStyle kBMITextStyle = TextStyle(fontSize: 18, color: kNotActiveIconColor);
const TextStyle kBMITextNumberStyle = TextStyle(fontSize: 50, fontWeight: FontWeight.w900);
const TextStyle kBottomPanelTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.w800
);
const TextStyle kBMIResultText = TextStyle(
    color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold
);

enum Gender{
  male, female
}