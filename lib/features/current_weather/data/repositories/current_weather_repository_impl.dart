import 'package:dvt_weather_app/features/current_weather/data/data_source/current_weather_remote_source.dart';
import 'package:dvt_weather_app/features/current_weather/domain/entities/current_weather_entity.dart';
import 'package:dvt_weather_app/features/current_weather/domain/repositories/current_weather_repository.dart';

class CurrentWeatherRepositoryImpl implements CurrentWeatherRepository {
  final CurrentWeatherRemoteSource remote;

  CurrentWeatherRepositoryImpl(this.remote);

  @override
  Future<CurrentWeatherEntity> getCurrentWeather(
    double latitude,
    double longtitude,
  ) {
    try {
      return remote.getCurrentWeather(latitude, longtitude);
    } catch (e) {
      rethrow;
    }
  }
}
