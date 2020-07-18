import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;

  double _bmi;

  CalculatorBrain({this.height, this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height/ 100, 2);
    //only shows one decimal digit
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25){
      return 'Overweight';
    } else if (_bmi > 18.5){
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation(){
    if(_bmi >= 25){
      return 'Waaaay to fat.';
    } else if (_bmi > 18.5){
      return 'You\'re fine.';
    } else {
      return 'Eat something.';
    }
  }
}