import 'package:dvt_weather_app/features/current_weather/domain/entities/main_weather_entity.dart';

class MainWeatherModel extends MainWeatherEntity {
  MainWeatherModel({
    required super.temp,
    required super.feelsLike,
    required super.tempMin,
    required super.tempMax,
    required super.pressure,
    required super.humidity,
  });

  factory MainWeatherModel.fromJson(Map<String, dynamic> json) {
    return MainWeatherModel(
      temp: json["temp"].toDouble(),
      feelsLike: json["feels_like"].toDouble(),
      tempMin: json["temp_min"].toDouble(),
      tempMax: json["temp_max"].toDouble(),
      pressure: json["pressure"],
      humidity: json["humidity"],
    );
  }
}
