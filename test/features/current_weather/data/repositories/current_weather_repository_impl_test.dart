import 'package:dvt_weather_app/core/error/exception.dart';
import 'package:dvt_weather_app/features/current_weather/data/data_source/current_weather_remote_source.dart';
import 'package:dvt_weather_app/features/current_weather/data/repositories/current_weather_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/current_weather/current_weather_fixture.dart';

class MockCurrentWeatherRemoteSource extends Mock
    implements CurrentWeatherRemoteSource {}

void main() {
  late CurrentWeatherRepositoryImpl repository;
  late MockCurrentWeatherRemoteSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockCurrentWeatherRemoteSource();
    repository = CurrentWeatherRepositoryImpl(mockRemoteDataSource);
  });
  group('getCurrentWeather', () {
    const mockLongtitude = 10.99;
    const mockLatitude = 44.34;
    test(
        'should return remote data when the call to remote data source is successfully.',
        () async {
      // arrange
      when(() => mockRemoteDataSource.getCurrentWeather(any(), any()))
          .thenAnswer((_) async => currentWeatherFixture);
      // act
      final response =
          await repository.getCurrentWeather(mockLatitude, mockLongtitude);
      // assert
      expect(response, currentWeatherFixture);
      verify(
        () => mockRemoteDataSource.getCurrentWeather(
            mockLatitude, mockLongtitude),
      ).called(1);
    });

    test(
        'should return server failure when the call to remote data source is unsuccefully ',
        () async {
      // arrange
      when(() => mockRemoteDataSource.getCurrentWeather(any(), any()))
          .thenThrow(ServerException());

      // assert
      expect(
        () => repository.getCurrentWeather(mockLatitude, mockLongtitude),
        throwsA(isInstanceOf<ServerException>()),
      );

      verify(
        () => mockRemoteDataSource.getCurrentWeather(
            mockLatitude, mockLongtitude),
      ).called(1);
    });
  });
}
