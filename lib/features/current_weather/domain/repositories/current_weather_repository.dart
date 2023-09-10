import 'package:dvt_weather_app/features/current_weather/domain/entities/current_weather_entity.dart';
import 'package:dvt_weather_app/features/current_weather/domain/entities/current_weather_forecast_entity.dart';

abstract class CurrentWeatherRepository {
  /// get current weather based on users location
  Future<CurrentWeatherEntity> getCurrentWeather(
    double latitude,
    double longtitude,
  );

  /// get current weather based on users location
  Future<CurrentWeatherForecastEntity> getCurrentWeatherForecast(
    double latitude,
    double longtitude,
  );
}
