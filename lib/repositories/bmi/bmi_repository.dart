import 'dart:math';

import 'package:flutter/material.dart';

class BmiRepository {
  String calculate(int height, int weight) {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  double bmi = 0.0;

  String result() {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (18.5 <= bmi && bmi < 25) {
      return "Normal";
    } else if (25 <= bmi && bmi < 30) {
      return "Overweight";
    }
    return 'Obese';
  }

  Color get color {
    if (bmi < 18.5) {
      return Colors.green;
    } else if (18.5 <= bmi && bmi < 25) {
      return Colors.blue;
    } else if (25 <= bmi && bmi < 30) {
      return Colors.yellow;
    }
    return Colors.red;
  }
}

enum BmiStatus {
  underweight,
  normal,
  overweight,
  obese,
}
