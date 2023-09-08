import 'package:flutter_test/flutter_test.dart';
import 'package:dvt_weather_app/features/current_weather/domain/usecases/get_current_weather_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/current_weather/current_weather_fixture.dart';
import '../../../../mocks/repository_mocks.dart';

void main() {
  late GetCurrentWeatherUseCase useCase;
  late MockCurrentWeatherRepository mockRepository;

  setUp(() {
    mockRepository = MockCurrentWeatherRepository();
    useCase = GetCurrentWeatherUseCase(mockRepository);
  });

  test('should get current weather from repository.', () async {
    // arrange
    const mockLongtitude = 10.99;
    const mockLatitude = 44.34;

    when(() => mockRepository.getCurrentWeather(any(), any())).thenAnswer(
      (_) async => currentWeatherFixture,
    );
    // act
    final result = await useCase(
      GetCurrentUserParams(
        latitude: mockLatitude,
        longtitude: mockLongtitude,
      ),
    );
    //assert
    expect(result, currentWeatherFixture);
    verify(() => mockRepository.getCurrentWeather(mockLatitude, mockLongtitude))
        .called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
