import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/input.page.dart';
import 'package:bmi_calculator/model/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  ResultsPage({@required this.bmiResult,@required this.resultText,@required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              'Your results',
              style: kBottomPanelTextStyle,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: kActiveBoxColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(resultText.toUpperCase(), style: kBMIResultText),
                  Text(
                    bmiResult,
                    style: kBMITextNumberStyle,
                  ),
                  Text(
                    interpretation,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          BottomPanel(text: 'RE-CALCULATE', onTap: (){
            Navigator.pop(context);
          },),
        ],
      ),
    );
  }
}
