import 'dart:convert';

import 'package:dvt_weather_app/features/current_weather/data/models/current_weather_forecast_model.dart';
import 'package:dvt_weather_app/features/current_weather/domain/entities/current_weather_forecast_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/current_weather/current_weather_forecast_item_fixture.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  test('should be a subclass of [CurrentWeatherForecastEntity]', () async {
    //assert
    expect(currentForecastFixture, isA<CurrentWeatherForecastEntity>());
  });

  test('fromJson - should return a valid model', () async {
    // arrange
    final Map<String, dynamic> jsonMap = jsonDecode(
      fixture('current_weather/get_current_weather_forecast.json'),
    );

    // act
    final result = CurrentWeatherForecastModel.fromJson(jsonMap);

    // assert
    expect(result, currentForecastFixture);
  });
}
