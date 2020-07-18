import 'package:bmi_calculator/calculator.brain.dart';
import 'package:bmi_calculator/components/bmi-box.dart';
import 'package:bmi_calculator/components/bmi.box.widget.dart';
import 'package:bmi_calculator/components/bmi.round.button.dart';
import 'package:bmi_calculator/components/bottom.panel.dart';
import 'package:bmi_calculator/model/result.dart';
import 'package:bmi_calculator/screens/results.page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

Color boxColorMale = kActiveBoxColor;
Color iconColorMale = kActiveIconColor;
Color boxColorFemale = kNotActiveBoxColor;
Color iconColorFemale = kNotActiveIconColor;

Gender selectedGender = Gender.male;

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 70;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BMIBox(
                    color: selectedGender == Gender.male
                        ? kActiveBoxColor
                        : kNotActiveBoxColor,
                    boxChild: BMIBoxWidget(
                      color: selectedGender == Gender.male
                          ? kActiveIconColor
                          : kNotActiveIconColor,
                      text: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                    choseThisGender: () {
                      choseMale();
                    },
                  ),
                ),
                Expanded(
                  child: BMIBox(
                    color: selectedGender == Gender.female
                        ? kActiveBoxColor
                        : kNotActiveBoxColor,
                    boxChild: BMIBoxWidget(
                        color: selectedGender == Gender.female
                            ? kActiveIconColor
                            : kNotActiveIconColor,
                        text: 'FEMALE',
                        icon: FontAwesomeIcons.venus),
                    choseThisGender: () {
                      choseFemale();
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BMIBox(
              color: kActiveBoxColor,
              boxChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'HEIGHT',
                    style: kBMITextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kBMITextNumberStyle,
                      ),
                      Text(
                        ' cm',
                        style: kBMITextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: kBottomPanelColor,
                        //the first two digits after 0x control the opacity
                        // 0xff means full opacity
                        overlayColor: Color(0x55eb1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 16),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 28)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
//                        activeColor: kBottomPanelColor,
                      inactiveColor: kActiveIconColor,
                      onChanged: (double value) {
                        height = value.round();
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BMIBox(
                    color: kActiveBoxColor,
                    boxChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kBMITextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kBMITextNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            BMIRoundButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                if (weight > 1) {
                                  weight--;
                                }
                                setState(() {});
                              },
                            ),
                            BMIRoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                if (weight < 300) {
                                  weight++;
                                }
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BMIBox(
                    color: kActiveBoxColor,
                    boxChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kBMITextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kBMITextNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            BMIRoundButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                if (age > 1) {
                                  age--;
                                }
                                setState(() {});
                              },
                            ),
                            BMIRoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                if (age < 100) {
                                  age++;
                                }
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomPanel(
            text: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void choseFemale() {
    selectedGender = Gender.female;
    setState(() {});
  }

  void choseMale() {
    selectedGender = Gender.male;
    setState(() {});
  }
}

class BottomPanel extends StatelessWidget {
  final String text;
  final Function onTap;

  BottomPanel({this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SafeArea(
        child: Container(
          color: kBottomPanelColor,
          width: double.infinity,
          height: kBottomPanelHeight,
          child: Center(
            child: Text(
              text,
              style: kBottomPanelTextStyle,
            ),
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
