import 'package:dvt_weather_app/features/current_weather/data/models/current_weather_model.dart';
import 'package:dvt_weather_app/features/current_weather/data/models/main_weather_model.dart';
import 'package:dvt_weather_app/features/current_weather/data/models/weather_model.dart';

final currentWeatherFixture = CurrentWeatherModel(
  main: mainCurrentWeatherFixture,
  weather: [weatherFixture],
);

final mainCurrentWeatherFixture = MainWeatherModel(
  temp: 298.48,
  feelsLike: 298.74,
  tempMin: 297.56,
  tempMax: 300.05,
  pressure: 1015,
  humidity: 64,
);

final weatherFixture = WeatherModel(
  id: 501,
  main: 'Rain',
  description: 'moderate rain',
  icon: '10d',
);
