import 'package:flutter/material.dart';

class BMIBox extends StatelessWidget {
  final Color color;
  final Widget boxChild;
  final Function choseThisGender;

  BMIBox({@required this.color, this.boxChild, this.choseThisGender});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: choseThisGender,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: boxChild,
      ),
    );
  }
}
