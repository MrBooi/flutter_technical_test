import 'package:dvt_weather_app/core/usecase/usecase.dart';
import 'package:dvt_weather_app/features/current_weather/domain/entities/current_weather_entity.dart';
import 'package:dvt_weather_app/features/current_weather/domain/repositories/current_weather_repository.dart';

class GetCurrentWeatherUseCase
    implements UseCase<CurrentWeatherEntity, GetCurrentUserParams> {
  final CurrentWeatherRepository repository;

  GetCurrentWeatherUseCase(this.repository);

  /// EST call for retrieving the [CurrentWeatherEntity} data from openWeather
  @override
  Future<CurrentWeatherEntity> call(GetCurrentUserParams params) async {
    return await repository.getCurrentWeather(
      params.latitude,
      params.longtitude,
    );
  }
}

class GetCurrentUserParams {
  final double latitude;
  final double longtitude;

  GetCurrentUserParams({required this.latitude, required this.longtitude});
}
