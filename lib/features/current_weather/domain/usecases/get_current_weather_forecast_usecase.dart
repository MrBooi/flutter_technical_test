import 'package:dvt_weather_app/core/usecase/usecase.dart';
import 'package:dvt_weather_app/features/current_weather/domain/entities/current_weather_forecast_entity.dart';
import 'package:dvt_weather_app/features/current_weather/domain/repositories/current_weather_repository.dart';

class GetCurrentWeatherForecastUseCase
    implements
        UseCase<CurrentWeatherForecastEntity,
            GetCurrentForecastLocationParams> {
  final CurrentWeatherRepository repository;

  GetCurrentWeatherForecastUseCase(this.repository);

  /// calls for retrieving the [CurrentWeatherForecastEntity} data from openWeather
  @override
  Future<CurrentWeatherForecastEntity> call(
      GetCurrentForecastLocationParams params) async {
    return await repository.getCurrentWeatherForecast(
      params.latitude,
      params.longtitude,
    );
  }
}

class GetCurrentForecastLocationParams {
  final double latitude;
  final double longtitude;

  GetCurrentForecastLocationParams({
    required this.latitude,
    required this.longtitude,
  });
}
