import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BMIBoxWidget extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;

  BMIBoxWidget({this.color, this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
          color: color,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 18, color: color),
        ),
      ],
    );
  }
}
