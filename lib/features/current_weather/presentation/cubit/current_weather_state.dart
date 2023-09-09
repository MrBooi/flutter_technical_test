import 'package:meta/meta.dart';
import 'package:dvt_weather_app/features/current_weather/data/models/current_weather_model.dart';

enum WeatherMode {
  clear('Sunny', '47AB2F', ''),
  rain('Rainy', '54575D', ''),
  clouds('Cloudy', '54717A', '');

  const WeatherMode(this.path, this.color, this.image);

  final String color;
  final String path;
  final String image;
}

@immutable
sealed class CurrentWeatherState {}

final class CurrentWeatherInitial extends CurrentWeatherState {}

final class CurrentWeatherLoading extends CurrentWeatherState {}

final class CurrentWeatherError extends CurrentWeatherState {}

final class CurrentWeatherLoaded extends CurrentWeatherState {
  final CurrentWeatherModel currentWeatherModel;
  CurrentWeatherLoaded(this.currentWeatherModel);
}
