abstract class MainWeatherEntity {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  MainWeatherEntity({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MainWeatherEntity &&
        other.temp == temp &&
        other.feelsLike == feelsLike &&
        other.tempMin == tempMin &&
        other.tempMax == tempMax &&
        other.pressure == pressure &&
        other.humidity == humidity;
  }

  @override
  int get hashCode {
    return temp.hashCode ^
        feelsLike.hashCode ^
        tempMin.hashCode ^
        tempMax.hashCode ^
        pressure.hashCode ^
        humidity.hashCode;
  }
}
