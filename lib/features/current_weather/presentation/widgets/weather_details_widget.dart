import 'package:dvt_weather_app/features/current_weather/data/models/main_weather_model.dart';
import 'package:dvt_weather_app/features/current_weather/presentation/widgets/weather_display_item.dart';
import 'package:flutter/material.dart';

class WeatherDetailsWidget extends StatelessWidget {
  final Color color;
  final MainWeatherModel mainWeatherModel;
  const WeatherDetailsWidget({
    super.key,
    required this.color,
    required this.mainWeatherModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60.0,
          color: color,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WeatherDisplayItem(
                  temp: mainWeatherModel.tempMin,
                  type: DisplayType.min,
                ),
                WeatherDisplayItem(
                  temp: mainWeatherModel.temp,
                  type: DisplayType.current,
                ),
                WeatherDisplayItem(
                  temp: mainWeatherModel.tempMax,
                  type: DisplayType.max,
                ),
              ],
            ),
          ),
        ),
        const Divider()
      ],
    );
  }
}
