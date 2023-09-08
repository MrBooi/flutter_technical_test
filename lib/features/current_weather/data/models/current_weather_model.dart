import 'package:dvt_weather_app/features/current_weather/data/models/main_weather_model.dart';
import 'package:dvt_weather_app/features/current_weather/data/models/weather_model.dart';
import 'package:dvt_weather_app/features/current_weather/domain/entities/current_weather_entity.dart';

class CurrentWeatherModel extends CurrentWeatherEntity {
  CurrentWeatherModel({
    required super.main,
    required super.weather,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      main: MainWeatherModel.fromJson(json['main']),
      weather: List.from(json['weather'])
          .map((w) => WeatherModel.fromJson(w))
          .toList(),
    );
  }
}
