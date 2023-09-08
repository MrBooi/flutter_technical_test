import 'package:dvt_weather_app/core/error/exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:dvt_weather_app/features/current_weather/data/data_source/current_weather_remote_source.dart';

import '../../../../fixtures/current_weather/current_weather_fixture.dart';
import '../../../../fixtures/fixture_reader.dart';
import '../../../../mocks/core_mocks.dart';

void main() {
  late CurrentWeatherRemoteSourceImpl source;
  late MockHttpClient mockHttpClient;
  const mockLongtitude = 10.99;
  const mockLatitude = 44.34;
  final mockUrl = Uri.parse(
    "https://openweathermap.org/data/2.5/weather?lat=$mockLatitude&lon=$mockLongtitude&appid=appId",
  );

  setUp(() {
    mockHttpClient = MockHttpClient();
    source = CurrentWeatherRemoteSourceImpl(mockHttpClient, appId: 'appId');
  });

  test(
    'should perform a Get request on a Url to fetch current weather from [openWeather] API.',
    () async {
      // arrange
      final responseData = fixture('current_weather/get_current_weather.json');

      when(() => mockHttpClient.get(mockUrl)).thenAnswer(
        (_) async => http.Response(responseData, 200),
      );
      //act
      final results = await source.getCurrentWeather(
        mockLatitude,
        mockLongtitude,
      );

      expect(results, currentWeatherFixture);

      verify(
        () => mockHttpClient.get(mockUrl),
      ).called(1);
    },
  );

  test(
    'should throw [ServerException] if api fails to get current weather.',
    () async {
      // arrange
      when(() => mockHttpClient.get(mockUrl)).thenAnswer(
        (_) async => http.Response('opps', 404),
      );

      // assert
      expect(
        () => source.getCurrentWeather(
          mockLatitude,
          mockLongtitude,
        ),
        throwsA(isInstanceOf<ServerException>()),
      );
    },
  );
}
