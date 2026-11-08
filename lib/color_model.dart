import 'package:flutter/material.dart';

class ColorModel extends ChangeNotifier {
  double _red = 206;
  double _green = 178;
  double _blue = 230;

  double get red => _red;
  double get green => _green;
  double get blue => _blue;

  Color get currentColor => Color.fromRGBO(
    _red.toInt(),
    _green.toInt(),
    _blue.toInt(),
    1.0,
  );

  void setRed(double value) {
    _red = value;
    notifyListeners(); // Повідомляє всі віджети-слухачі про зміну
  }

  void setGreen(double value) {
    _green = value;
    notifyListeners();
  }

  void setBlue(double value) {
    _blue = value;
    notifyListeners();
  }
}