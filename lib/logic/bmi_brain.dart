import 'dart:math';



class BmiCalculation {

  final int height;
  final int weight;
  double _bmi;

  BmiCalculation({this.height, this.weight});

  String calculateBmi() {
    double bmi = weight / pow(height/100, 2);
    _bmi = bmi;
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 25.5) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    }

    return 'Underweight';
  }

  String getInterpretation() {
    if (_bmi > 25.5) {
      return 'Your BMI is high, I will suggestion taking actions to stabilize it';
    } else if (_bmi >= 18.5) {
      return 'Your BMI is normal. Good Job!';
    }

    return 'Your BMI is low. I will suggestion taking actions to stabilize it';
  }

}