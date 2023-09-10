import 'package:dvt_weather_app/features/current_weather/data/models/current_weather_forecast_model.dart';
import 'package:dvt_weather_app/features/current_weather/data/models/forecast_weather_item_model.dart';
import 'package:dvt_weather_app/features/current_weather/data/models/main_weather_model.dart';
import 'package:dvt_weather_app/features/current_weather/data/models/weather_model.dart';

final currentWeatherForecastItemFixture = ForecastWeatherItemModel(
  dtTxt: '2023-09-10 00:00:00',
  dt: 1694304000,
  main: MainWeatherModel(
    temp: 303.54,
    feelsLike: 310.54,
    tempMin: 303.51,
    tempMax: 303.54,
    pressure: 1005,
    humidity: 75,
  ),
  weather: [
    WeatherModel(
      id: 802,
      main: 'Clouds',
      description: 'scattered clouds',
      icon: '03n',
    )
  ],
);

final currentForecastFixture = CurrentWeatherForecastModel(
  list: [
    currentWeatherForecastItemFixture,
    ForecastWeatherItemModel(
      dtTxt: '2023-09-10 03:00:00',
      dt: 1694314800,
      main: MainWeatherModel(
        temp: 303.56,
        feelsLike: 310.56,
        tempMin: 303.56,
        tempMax: 303.56,
        pressure: 1006,
        humidity: 76,
      ),
      weather: [
        WeatherModel(
          id: 803,
          main: 'Clouds',
          description: 'broken clouds',
          icon: '04d',
        )
      ],
    ),
    ForecastWeatherItemModel(
      dtTxt: '2023-09-10 06:00:00',
      dt: 1694325600,
      main: MainWeatherModel(
        temp: 303.79,
        feelsLike: 310.37,
        tempMin: 303.79,
        tempMax: 303.79,
        pressure: 1006,
        humidity: 72,
      ),
      weather: [
        WeatherModel(
          id: 804,
          main: 'Clouds',
          description: 'overcast clouds',
          icon: '04d',
        )
      ],
    ),
    ForecastWeatherItemModel(
      dtTxt: '2023-09-10 09:00:00',
      dt: 1694336400,
      main: MainWeatherModel(
        temp: 304.12,
        feelsLike: 310.97,
        tempMin: 304.12,
        tempMax: 304.12,
        pressure: 1005,
        humidity: 71,
      ),
      weather: [
        WeatherModel(
          id: 803,
          main: 'Clouds',
          description: 'broken clouds',
          icon: '04d',
        )
      ],
    ),
    ForecastWeatherItemModel(
      dtTxt: '2023-09-10 12:00:00',
      dt: 1694347200,
      main: MainWeatherModel(
        temp: 304.14,
        feelsLike: 311.14,
        tempMin: 304.14,
        tempMax: 304.14,
        pressure: 1002,
        humidity: 75,
      ),
      weather: [
        WeatherModel(
          id: 803,
          main: 'Clouds',
          description: 'broken clouds',
          icon: '04d',
        )
      ],
    ),
  ],
);
