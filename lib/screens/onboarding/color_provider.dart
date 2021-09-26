import 'package:flutter/material.dart';

class ColorProvider with ChangeNotifier {
  Color _color = Colors.white;

  Color get color => _color;

  set color(Color color) {
    _color = color;
    notifyListeners();
  }
}
