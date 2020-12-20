import 'dart:math';

class BmiCalculator {
  BmiCalculator({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calcbmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getinterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more. 🏋️🏋️🏋️';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job! 🙂';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more. 😋🍴🍔';
    }
  }
}
