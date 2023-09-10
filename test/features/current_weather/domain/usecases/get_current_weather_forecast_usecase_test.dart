import 'package:dvt_weather_app/features/current_weather/domain/usecases/get_current_weather_forecast_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/current_weather/current_weather_forecast_item_fixture.dart';
import '../../../../mocks/repository_mocks.dart';

void main() {
  late GetCurrentWeatherForecastUseCase useCase;
  late MockCurrentWeatherRepository mockRepository;

  setUp(() {
    mockRepository = MockCurrentWeatherRepository();
    useCase = GetCurrentWeatherForecastUseCase(mockRepository);
  });

  test('should get current weather from repository.', () async {
    // arrange
    const mockLongtitude = 10.99;
    const mockLatitude = 44.34;

    when(() => mockRepository.getCurrentWeatherForecast(any(), any()))
        .thenAnswer(
      (_) async => currentForecastFixture,
    );
    // act
    final result = await useCase(
      GetCurrentLocationParams(
        latitude: mockLatitude,
        longtitude: mockLongtitude,
      ),
    );
    //assert
    expect(result, currentForecastFixture);
    verify(
      () => mockRepository.getCurrentWeatherForecast(
          mockLatitude, mockLongtitude),
    ).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
