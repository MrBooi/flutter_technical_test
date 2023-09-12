import 'dart:convert';

import 'package:dvt_weather_app/features/current_location/data/models/location_model.dart';
import 'package:dvt_weather_app/features/current_location/domain/entities/location_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/current_location/current_location_fixture.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  test('should be a subclass of [LocationEntity]', () async {
    //assert
    expect(currentLocationFixture, isA<LocationEntity>());
  });

  test('fromJson - should return a valid model', () async {
    // arrange
    final Map<String, dynamic> jsonMap =
        jsonDecode(fixture('current_location/get_location.json'));

    // act
    final result = LocationModel.fromJson(jsonMap);

    // assert
    expect(result, currentLocationFixture);
  });
}
