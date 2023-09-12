import 'package:dvt_weather_app/features/current_weather/data/models/current_weather_forecast_model.dart';
import 'package:dvt_weather_app/features/current_weather/data/models/current_weather_model.dart';
import 'package:dvt_weather_app/features/current_weather/domain/usecases/get_current_weather_forecast_usecase.dart';
import 'package:dvt_weather_app/features/current_weather/domain/usecases/get_current_weather_usecase.dart';
import 'package:dvt_weather_app/features/current_weather/presentation/cubit/current_weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  final GetCurrentWeatherUseCase currentWeatherUseCase;
  final GetCurrentWeatherForecastUseCase currentWeatherForecastUseCase;
  CurrentWeatherCubit({
    required this.currentWeatherUseCase,
    required this.currentWeatherForecastUseCase,
  }) : super(CurrentWeatherInitial());

  Future<void> fetchCurrentWeather() async {
    emit(CurrentWeatherLoading());

    try {
      final location = await Geolocator.getCurrentPosition();

      final currentRequest = await currentWeatherUseCase(
        GetCurrentLocationParams(
          latitude: location.latitude,
          longtitude: location.longitude,
        ),
      );

      final forecastRequest = await currentWeatherForecastUseCase(
        GetCurrentForecastLocationParams(
          latitude: location.latitude,
          longtitude: location.longitude,
        ),
      );

      final response = await Future.value(
        [
          currentRequest,
          forecastRequest,
        ],
      );

      emit(
        CurrentWeatherLoaded(response[0] as CurrentWeatherModel,
            response[1] as CurrentWeatherForecastModel),
      );
    } catch (e) {
      emit(CurrentWeatherError());
    }
  }
}
