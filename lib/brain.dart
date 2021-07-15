import 'dart:math';

class brain {
  brain({required this.height,required this.weight});
  final int height;
  final int weight;

  double _bmi=18.3;

  String calculateBmi()
  {
    _bmi=weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }
  String check()
  {
    if(_bmi>=25) {
      return 'Overweight';
    }
    else if (_bmi>18.5)
    {
      return 'Normal';
    }
    else
    {
    return 'Underweight';
    }
  }
  String statement()
  {
    if(_bmi>=25) {
      return 'Your Weight more than normal body,You should exercise more.';
    }
    else if (_bmi>18.5)
    {
      return 'Your Weight is Normal';
    }
    else
    {
      return 'Your Weight is less than normal body,You should eat more.';
    }
  }
}