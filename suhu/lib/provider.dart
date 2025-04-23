import 'package:flutter/material.dart';

class TemperatureProvider extends ChangeNotifier {
  double _convertedValue = 0.0;
  String _selectedUnit = 'Celsius to Fahrenheit';
  final TextEditingController controller = TextEditingController();

  double get convertedValue => _convertedValue;
  String get selectedUnit => _selectedUnit;

  void setSelectedUnit(String value) {
    _selectedUnit = value;
    notifyListeners();
  }

  void convert() {
    double input = double.tryParse(controller.text) ?? 0.0;
    switch (_selectedUnit) {
      case 'Celsius to Fahrenheit':
        _convertedValue = (input * 9 / 5) + 32;
        break;
      case 'Fahrenheit to Celsius':
        _convertedValue = (input - 32) * 5 / 9;
        break;
      case 'Celsius to Kelvin':
        _convertedValue = input + 273.15;
        break;
      case 'Kelvin to Celsius':
        _convertedValue = input - 273.15;
        break;
      case 'Celsius to Reaumur':
        _convertedValue = input * 4 / 5;
        break;
      case 'Reaumur to Celsius':
        _convertedValue = input * 5 / 4;
        break;
    }
    notifyListeners();
  }
}
