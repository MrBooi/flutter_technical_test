import 'package:bloc_test/bloc_test.dart';
import 'package:dvt_weather_app/core/error/exception.dart';
import 'package:dvt_weather_app/features/current_weather/domain/usecases/get_current_weather_forecast_usecase.dart';
import 'package:dvt_weather_app/features/current_weather/domain/usecases/get_current_weather_usecase.dart';
import 'package:dvt_weather_app/features/current_weather/presentation/cubit/current_weather_cubit.dart';
import 'package:dvt_weather_app/features/current_weather/presentation/cubit/current_weather_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/current_weather/current_weather_fixture.dart';
import '../../../../fixtures/current_weather/current_weather_forecast_item_fixture.dart';

class MockGetCurrentWeatherUsecase extends Mock
    implements GetCurrentWeatherUseCase {}

class MockGetCurrentWeatherForecastUsecase extends Mock
    implements GetCurrentWeatherForecastUseCase {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late CurrentWeatherCubit cubit;
  late MockGetCurrentWeatherUsecase mockCurrentWeatherUsecase;
  late MockGetCurrentWeatherForecastUsecase mockCurrentWeatherForecastUsecase;

  setUp(() {
    mockCurrentWeatherUsecase = MockGetCurrentWeatherUsecase();
    mockCurrentWeatherForecastUsecase = MockGetCurrentWeatherForecastUsecase();

    cubit = CurrentWeatherCubit(
      currentWeatherUseCase: mockCurrentWeatherUsecase,
      currentWeatherForecastUseCase: mockCurrentWeatherForecastUsecase,
    );
  });

  test('Should check if initial state is Empty', () {
    // assert
    expect(cubit.state, CurrentWeatherInitial());
  });

  group('fetchCurrentWeather', skip: true, () {
    final mockCurrentLocation = GetCurrentLocationParams(
      latitude: 13.34,
      longtitude: -30.34,
    );

    final mockForecastLocation = GetCurrentForecastLocationParams(
      latitude: 13.34,
      longtitude: -30.34,
    );

    blocTest<CurrentWeatherCubit, CurrentWeatherState>(
      'should emit [CurrentWeatherError] state if api failed to fetch current weather and weather forecast.',
      build: () => cubit,
      setUp: () {
        when(() => mockCurrentWeatherUsecase(mockCurrentLocation)).thenThrow(
          (_) async => ServerException(),
        );
        when(() => mockCurrentWeatherForecastUsecase(mockForecastLocation))
            .thenThrow(
          (_) async => ServerException(),
        );
      },
      act: (cubit) => cubit.fetchCurrentWeather(),
      expect: () => [CurrentWeatherLoading(), CurrentWeatherError()],
    );
    blocTest(
      'should emit [CurrentWeatherLoaded] state when api fetch data for current weather and weather forecast.',
      build: () => cubit,
      setUp: () {
        when(() => Geolocator.getCurrentPosition()).thenAnswer(
          (_) async => Position(
            longitude: -30.34,
            latitude: 13.34,
            timestamp: null,
            accuracy: 0.0,
            altitude: 0.0,
            heading: 0.0,
            speed: 0.0,
            speedAccuracy: 0.0,
          ),
        );
        when(() => mockCurrentWeatherUsecase(mockCurrentLocation)).thenAnswer(
          (_) async => currentWeatherFixture,
        );
        when(() => mockCurrentWeatherForecastUsecase(mockForecastLocation))
            .thenAnswer(
          (_) async => currentForecastFixture,
        );
      },
      act: (cubit) => cubit.fetchCurrentWeather(),
      expect: () => [
        CurrentWeatherLoading(),
      ],
    );
  });
}
