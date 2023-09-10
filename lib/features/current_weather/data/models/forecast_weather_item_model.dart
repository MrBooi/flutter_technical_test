import 'package:dvt_weather_app/features/current_weather/data/models/main_weather_model.dart';
import 'package:dvt_weather_app/features/current_weather/data/models/weather_model.dart';
import 'package:dvt_weather_app/features/current_weather/domain/entities/forecast_weather_item_entity.dart';

class ForecastWeatherItemModel extends ForecastWeatherItemEntity {
  ForecastWeatherItemModel({
    required super.dtTxt,
    required super.dt,
    required super.main,
    required super.weather,
  });

  factory ForecastWeatherItemModel.fromJson(Map<String, dynamic> json) {
    return ForecastWeatherItemModel(
      dt: json['dt'],
      main: MainWeatherModel.fromJson(json['main']),
      weather: List.from(json['weather'])
          .map((w) => WeatherModel.fromJson(w))
          .toList(),
      dtTxt: json['dt_txt'],
    );
  }
}
