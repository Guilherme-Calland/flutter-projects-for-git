import 'package:bmi_calculator/screens/results.page.dart';
import 'package:flutter/material.dart';

import 'screens/input.page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0B1534),
        scaffoldBackgroundColor: Color(0xff0B1534),
      ),
      home: InputPage(),
    );
  }
}

