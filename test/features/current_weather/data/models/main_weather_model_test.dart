import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';

import 'package:dvt_weather_app/features/current_weather/data/models/main_weather_model.dart';
import 'package:dvt_weather_app/features/current_weather/domain/entities/main_weather_entity.dart';

import '../../../../fixtures/current_weather/current_weather_fixture.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  test('should be a subclass of [MainWeatherEntity]', () async {
    //assert
    expect(mainCurrentWeatherFixture, isA<MainWeatherEntity>());
  });

  test('fromJson - should return a valid model', () async {
    // arrange
    final Map<String, dynamic> jsonMap =
        jsonDecode(fixture('current_weather/get_current_weather.json'));

    // act
    final result = MainWeatherModel.fromJson(jsonMap['main']);

    // assert
    expect(result, mainCurrentWeatherFixture);
  });
}
