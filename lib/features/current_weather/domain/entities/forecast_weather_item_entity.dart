import 'package:flutter/foundation.dart';

import 'package:dvt_weather_app/features/current_weather/domain/entities/main_weather_entity.dart';
import 'package:dvt_weather_app/features/current_weather/domain/entities/weather_entity.dart';

abstract class ForecastWeatherItemEntity {
  final int dt;
  final MainWeatherEntity main;
  final List<WeatherEntity> weather;
  final String dtTxt;

  ForecastWeatherItemEntity({
    required this.dtTxt,
    required this.dt,
    required this.main,
    required this.weather,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ForecastWeatherItemEntity &&
        other.dt == dt &&
        other.main == main &&
        listEquals(other.weather, weather) &&
        other.dtTxt == dtTxt;
  }

  @override
  int get hashCode {
    return dt.hashCode ^ main.hashCode ^ weather.hashCode ^ dtTxt.hashCode;
  }
}
