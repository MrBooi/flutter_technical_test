import 'package:dvt_weather_app/features/current_weather/data/models/forecast_weather_item_model.dart';
import 'package:dvt_weather_app/features/current_weather/domain/entities/current_weather_forecast_entity.dart';

class CurrentWeatherForecastModel extends CurrentWeatherForecastEntity {
  CurrentWeatherForecastModel({required super.list});

  factory CurrentWeatherForecastModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherForecastModel(
      list: List.from(json['list'])
          .map((w) => ForecastWeatherItemModel.fromJson(w))
          .toList(),
    );
  }
}
