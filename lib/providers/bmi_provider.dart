import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/bmi_service.dart';

// Define a provider for BMIService
final bmiServiceProvider = Provider((ref) => BMIService());

// StateNotifier to manage BMI calculations
class BMIStateNotifier extends StateNotifier<double?> {
  final BMIService _bmiService;

  BMIStateNotifier(this._bmiService) : super(null);

  void calculate(double height, double weight) {
    state = _bmiService.calculateBMI(height, weight);
  }
}

// Provider to access BMIStateNotifier
final bmiProvider = StateNotifierProvider<BMIStateNotifier, double?>((ref) {
  final bmiService = ref.read(bmiServiceProvider);
  return BMIStateNotifier(bmiService);
});