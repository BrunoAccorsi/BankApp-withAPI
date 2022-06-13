import 'package:flutter/material.dart';

class Balance extends ChangeNotifier {
  double value;
  bool hide = true;
  dynamic valueController = '0.0';

  Balance(this.value);

  void add(value) {
    this.value += value;
    valueController = this.value.toString();
    print(this.value.toString());

    notifyListeners();
  }

  void subtract(value) {
    this.value -= value;
    valueController = this.value.toString();

    notifyListeners();
  }

  void toggleHide() {
    final bool currentValueHide = hide;
    hide = currentValueHide == true ? false : true;

    notifyListeners();
  }

  @override
  String toString() {
    return hide ? '* * * * * *' : '\$ $valueController';
  }
}
