import 'package:dvt_weather_app/core/helpers/temperature_converter_helpers.dart';
import 'package:dvt_weather_app/core/shared/copy_text.dart';
import 'package:dvt_weather_app/core/shared/offline_assert/render_local_image.dart';
import 'package:dvt_weather_app/core/theme/theme.dart';
import 'package:dvt_weather_app/features/current_weather/data/models/current_weather_model.dart';
import 'package:dvt_weather_app/features/current_weather/data/models/weather_model.dart';
import 'package:flutter/material.dart';

class MainWeatherWidget extends StatelessWidget {
  final CurrentWeatherModel model;
  const MainWeatherWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final weatherMode = (model.weather[0] as WeatherModel).weatherMode;
    return SliverAppBar(
      pinned: true,
      backgroundColor: Color(weatherMode.color),
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            RenderLocalImage(
              fileName: weatherMode.imagePath,
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CopyText(
                  '${TemperatureConverterHelpers.convertTempCelsius(model.main.tempMax)}\u00b0',
                  style: AppTheme.themeData.textTheme.displayLarge,
                ),
                CopyText(
                  weatherMode.path,
                  style: AppTheme.themeData.textTheme.displayLarge,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
