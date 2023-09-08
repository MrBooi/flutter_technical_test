import 'package:dvt_weather_app/features/current_weather/data/models/weather_model.dart';
import 'package:dvt_weather_app/features/current_weather/domain/entities/weather_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';

import '../../../../fixtures/current_weather/current_weather_fixture.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  test('should be a subclass of [WeatherEntity]', () async {
    //assert
    expect(weatherFixture, isA<WeatherEntity>());
  });

  test('fromJson - should return a valid model', () async {
    // arrange
    final Map<String, dynamic> jsonMap =
        jsonDecode(fixture('current_weather/get_current_weather.json'));

    // act
    final result = WeatherModel.fromJson(jsonMap['weather'][0]);

    // assert
    expect(result, weatherFixture);
  });
}
