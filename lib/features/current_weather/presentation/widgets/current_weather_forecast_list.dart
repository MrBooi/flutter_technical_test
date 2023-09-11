import 'package:dvt_weather_app/core/extensions/date_extension.dart';
import 'package:dvt_weather_app/core/helpers/media_query_helpers.dart';
import 'package:dvt_weather_app/core/helpers/temperature_converter_helpers.dart';
import 'package:dvt_weather_app/core/shared/copy_text.dart';
import 'package:dvt_weather_app/core/shared/offline_assert/render_local_image.dart';
import 'package:dvt_weather_app/core/theme/theme.dart';
import 'package:dvt_weather_app/features/current_weather/data/models/forecast_weather_item_model.dart';
import 'package:dvt_weather_app/features/current_weather/data/models/weather_model.dart';
import 'package:dvt_weather_app/features/current_weather/presentation/cubit/current_weather_cubit.dart';
import 'package:dvt_weather_app/features/current_weather/presentation/cubit/current_weather_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentWeatherForecastList extends StatelessWidget {
  const CurrentWeatherForecastList({super.key});

  @override
  Widget build(BuildContext context) {
    final forecastList =
        context.select<CurrentWeatherCubit, List<ForecastWeatherItemModel>>(
      (value) {
        return (value.state as CurrentWeatherLoaded)
            .forecastModel
            .getFilteredList;
      },
    );

    return SliverList.builder(
      itemCount: forecastList.length,
      itemBuilder: (context, idx) {
        final item = forecastList[idx];

        return SizedBox(
          height: MediaQueryHelpers.screenHeight(context, multiplier: 0.1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CopyText(
                    DateTime.fromMillisecondsSinceEpoch(item.dt * 1000)
                        .getWeekDayName,
                    style: AppTheme.themeData.textTheme.headlineMedium,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: RenderLocalImage(
                      height: null,
                      fit: BoxFit.contain,
                      fileName:
                          (item.weather[0] as WeatherModel).weatherMode.icon,
                    ),
                  ),
                ),
                Expanded(
                  child: CopyText(
                    "${TemperatureConverterHelpers.convertTempCelsius(item.main.temp)}\u00b0",
                    textAlign: TextAlign.end,
                    style: AppTheme.themeData.textTheme.headlineMedium,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

String convertDateString(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  return dateTime.toString();
}

double kelvinToCelsius(double kelvin) {
  double celsius = kelvin - 273.15;
  return celsius;
}
