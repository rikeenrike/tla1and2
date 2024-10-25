class BMIService {
  double calculateBMI(double height, double weight) {
    return weight / ((height / 100) * (height / 100)); // Height in cm
  }
}