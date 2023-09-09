import 'package:dvt_weather_app/features/current_weather/data/models/current_weather_model.dart';
import 'package:dvt_weather_app/features/current_weather/domain/usecases/get_current_weather_usecase.dart';
import 'package:dvt_weather_app/features/current_weather/presentation/cubit/current_weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  final GetCurrentWeatherUseCase currentWeatherUseCase;
  CurrentWeatherCubit(this.currentWeatherUseCase)
      : super(CurrentWeatherInitial());

  Future<void> fetchCurrentWeather() async {
    emit(CurrentWeatherLoading());

    try {
      final response = await currentWeatherUseCase(
        GetCurrentUserParams(
          latitude: 37.751,
          longtitude: -97.822,
        ),
      );

      emit(CurrentWeatherLoaded(response as CurrentWeatherModel));
    } catch (e) {
      emit(CurrentWeatherError());
    }
  }
}
