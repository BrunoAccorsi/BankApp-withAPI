import 'package:flutter/material.dart';

class Balance extends ChangeNotifier {
  double value;

  Balance(this.value);

  void add(value) {
    this.value += value;

    notifyListeners();
  }

  void subtract(value) {
    this.value -= value;

    notifyListeners();
  }

  @override
  String toString() {
    return '\$ $value';
  }
}