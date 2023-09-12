import 'package:dvt_weather_app/features/current_weather/data/models/current_weather_forecast_model.dart';
import 'package:equatable/equatable.dart';
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
sealed class CurrentWeatherState extends Equatable {}

final class CurrentWeatherInitial extends CurrentWeatherState {
  @override
  List<Object?> get props => [];
}

final class CurrentWeatherLoading extends CurrentWeatherState {
  @override
  List<Object?> get props => [];
}

final class CurrentWeatherError extends CurrentWeatherState {
  @override
  List<Object?> get props => [];
}

final class CurrentWeatherLoaded extends CurrentWeatherState {
  final CurrentWeatherModel currentWeatherModel;
  final CurrentWeatherForecastModel forecastModel;
  CurrentWeatherLoaded(
    this.currentWeatherModel,
    this.forecastModel,
  );

  @override
  List<Object?> get props => [currentWeatherModel, forecastModel];
}
