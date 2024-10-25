import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/bmi_provider.dart';

class BMIScreen extends ConsumerWidget {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bmi = ref.watch(bmiProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _heightController,
              decoration: InputDecoration(
                labelText: 'Height (cm)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _weightController,
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final height = double.tryParse(_heightController.text);
                final weight = double.tryParse(_weightController.text);

                if (height != null && weight != null) {
                  ref.read(bmiProvider.notifier).calculate(height, weight);
                }
              },
              child: Text("Calculate BMI"),
            ),
            SizedBox(height: 20),
            if (bmi != null)
              Text(
                'Your BMI: ${bmi.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24),
              ),
          ],
        ),
      ),
    );
  }
}