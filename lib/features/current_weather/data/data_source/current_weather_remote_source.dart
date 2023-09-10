import 'dart:convert';

import 'package:dvt_weather_app/core/error/exception.dart';
import 'package:dvt_weather_app/core/network/endpoint_builder.dart';
import 'package:dvt_weather_app/features/current_weather/data/models/current_weather_forecast_model.dart';
import 'package:http/http.dart' as http;

import 'package:dvt_weather_app/features/current_weather/data/models/current_weather_model.dart';

abstract class CurrentWeatherRemoteSource {
  /// Calls the https://openweathermap.org/data/2.5/weather endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<CurrentWeatherModel> getCurrentWeather(
    double latitude,
    double longtitude,
  );

  /// Calls the https://openweathermap.org/data/2.5/forecast endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<CurrentWeatherForecastModel> getCurrentWeatherForecast(
    double latitude,
    double longtitude,
  );
}

class CurrentWeatherRemoteSourceImpl implements CurrentWeatherRemoteSource {
  final http.Client httpClient;
  final String appId;

  CurrentWeatherRemoteSourceImpl(this.httpClient, {required this.appId});

  /// REST call for retrieving accounts data from openWeather
  @override
  Future<CurrentWeatherModel> getCurrentWeather(
    double latitude,
    double longtitude,
  ) async {
    final uri = EndpointBuilder.uri(
      '/data/2.5/weather',
      queryParameters: {
        'lat': latitude.toString(),
        'lon': longtitude.toString(),
        'appid': appId
      },
    );

    final response = await httpClient.get(uri);

    if (response.statusCode == 200) {
      return CurrentWeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CurrentWeatherForecastModel> getCurrentWeatherForecast(
    double latitude,
    double longtitude,
  ) async {
    final uri = EndpointBuilder.uri(
      '/data/2.5/forecast',
      queryParameters: {
        'lat': latitude.toString(),
        'lon': longtitude.toString(),
        'appid': appId
      },
    );

    final response = await httpClient.get(uri);

    if (response.statusCode == 200) {
      return CurrentWeatherForecastModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
