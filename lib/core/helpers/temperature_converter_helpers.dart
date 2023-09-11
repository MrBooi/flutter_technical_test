class TemperatureConverterHelpers {
  static int convertTempCelsius(double temp) {
    final result = (temp - 273.15).toStringAsFixed(0);
    return int.parse(result);
  }
}
