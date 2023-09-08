import 'package:dvt_weather_app/core/network/endpoint_builder.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should verify that the endpoint builder is being successfully.', () {
    const path = 'current';
    const mockUrl = 'https://openweathermap.org/current';

    expect(EndpointBuilder.uri(path).toString(), mockUrl);
    expect(EndpointBuilder.uri(path).path, '/$path');
  });
}
