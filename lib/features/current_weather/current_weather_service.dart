import 'package:dvt_weather_app/features/current_weather/data/data_source/current_weather_remote_source.dart';
import 'package:dvt_weather_app/features/current_weather/data/repositories/current_weather_repository_impl.dart';
import 'package:dvt_weather_app/features/current_weather/domain/repositories/current_weather_repository.dart';
import 'package:dvt_weather_app/features/current_weather/domain/usecases/get_current_weather_usecase.dart';
import 'package:dvt_weather_app/features/current_weather/presentation/cubit/current_weather_cubit.dart';
import 'package:dvt_weather_app/locator.dart';

void currentWeatherServices() {
  /// cubit
  sl.registerFactory(() => CurrentWeatherCubit(sl()));

  /// use cases
  sl.registerLazySingleton(
    () => GetCurrentWeatherUseCase(
      sl(),
    ),
  );

  /// Repository
  sl.registerLazySingleton<CurrentWeatherRepository>(
    () => CurrentWeatherRepositoryImpl(
      sl(),
    ),
  );

  /// Data sources
  sl.registerLazySingleton<CurrentWeatherRemoteSource>(
    () => CurrentWeatherRemoteSourceImpl(sl(),
        appId: '1c1d0a317f4090e4791b65c5fc84ae1d' // ADD API HERE,
        ),
  );
}
