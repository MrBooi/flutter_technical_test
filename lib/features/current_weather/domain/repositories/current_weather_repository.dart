import 'package:dvt_weather_app/features/current_weather/domain/entities/current_weather_entity.dart';

abstract class CurrentWeatherRepository {
  Future<CurrentWeatherEntity> getCurrentWeather(
    double latitude,
    double longtitude,
  );
}
