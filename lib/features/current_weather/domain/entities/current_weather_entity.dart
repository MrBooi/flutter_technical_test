import 'package:flutter/foundation.dart';

import 'package:dvt_weather_app/features/current_weather/domain/entities/main_weather_entity.dart';
import 'package:dvt_weather_app/features/current_weather/domain/entities/weather_entity.dart';

abstract class CurrentWeatherEntity {
  final MainWeatherEntity main;
  final List<WeatherEntity> weather;

  CurrentWeatherEntity({required this.main, required this.weather});

  @override
  String toString() => 'CurrentWeatherEntity(main: $main, weather: $weather)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CurrentWeatherEntity &&
        other.main == main &&
        listEquals(other.weather, weather);
  }

  @override
  int get hashCode => main.hashCode ^ weather.hashCode;
}
