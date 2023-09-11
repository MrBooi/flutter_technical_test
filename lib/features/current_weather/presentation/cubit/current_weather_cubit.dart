import 'package:dvt_weather_app/features/current_weather/data/models/current_weather_forecast_model.dart';
import 'package:dvt_weather_app/features/current_weather/data/models/current_weather_model.dart';
import 'package:dvt_weather_app/features/current_weather/domain/usecases/get_current_weather_forecast_usecase.dart';
import 'package:dvt_weather_app/features/current_weather/domain/usecases/get_current_weather_usecase.dart';
import 'package:dvt_weather_app/features/current_weather/presentation/cubit/current_weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      final currentRequest = await currentWeatherUseCase(
        GetCurrentLocationParams(
          latitude: 37.751,
          longtitude: -97.822,
        ),
      );

      final forecastRequest = await currentWeatherForecastUseCase(
        GetCurrentForecastLocationParams(
          latitude: 37.751,
          longtitude: -97.822,
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
