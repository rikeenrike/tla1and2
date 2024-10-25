import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/bmi_service.dart';

class BMIProvider extends ChangeNotifier {
  final BMIService _bmiService = BMIService();
  double? _bmi;

  double? get bmi => _bmi;

  void calculate(double height, double weight) {
    _bmi = _bmiService.calculateBMI(height, weight);
    notifyListeners();
  }
}

final bmiProvider = ChangeNotifierProvider((ref) => BMIProvider());