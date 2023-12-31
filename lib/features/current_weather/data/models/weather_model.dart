import 'package:dvt_weather_app/features/current_weather/domain/entities/weather_entity.dart';

enum WeatherMode {
  clear(
    'Sunny',
    0xFF47AB2F,
    'assets/images/forest_sunny.png',
    'assets/icons/clear@3x.png',
  ),
  rain(
    'Rainy',
    0xFF54575D,
    'assets/images/forest_rainy.png',
    'assets/icons/rain@3x.png',
  ),
  clouds(
    'Cloudy',
    0xFF54717A,
    'assets/images/forest_cloudy.png',
    'assets/icons/partlysunny@3x.png',
  );

  const WeatherMode(this.path, this.color, this.imagePath, this.icon);

  final int color;
  final String path;
  final String imagePath;
  final String icon;
}

class WeatherModel extends WeatherEntity {
  WeatherModel({
    required int id,
    required String main,
    required String description,
    required String icon,
  }) : super(
          id: id,
          main: main,
          description: description,
          icon: icon,
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      id: json["id"],
      main: json["main"],
      description: json["description"],
      icon: json["icon"],
    );
  }

  WeatherMode get weatherMode => WeatherMode.values.firstWhere(
        (e) => e.name.toLowerCase() == main.toLowerCase(),
        orElse: () {
          // for now we will also default to clear mode if mode is not supported.
          return WeatherMode.clear;
        },
      );
}
