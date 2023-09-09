import 'package:dvt_weather_app/features/current_weather/data/models/current_weather_model.dart';
import 'package:dvt_weather_app/features/current_weather/data/models/main_weather_model.dart';
import 'package:dvt_weather_app/features/current_weather/data/models/weather_model.dart';
import 'package:dvt_weather_app/features/current_weather/presentation/cubit/current_weather_cubit.dart';
import 'package:dvt_weather_app/features/current_weather/presentation/cubit/current_weather_state.dart';
import 'package:dvt_weather_app/features/current_weather/presentation/widgets/main_weather_widget.dart';
import 'package:dvt_weather_app/features/current_weather/presentation/widgets/weather_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentWeatherPage extends StatelessWidget {
  const CurrentWeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model =
        context.select<CurrentWeatherCubit, CurrentWeatherModel>((value) {
      return (value.state as CurrentWeatherLoaded).currentWeatherModel;
    });

    return CustomScrollView(
      slivers: [
        MainWeatherWidget(
          model: model,
        ),
        SliverToBoxAdapter(
          child: WeatherDetailsWidget(
            mainWeatherModel: model.main as MainWeatherModel,
            color: Color(
              (model.weather[0] as WeatherModel).weatherMode.color,
            ),
          ),
        )
      ],
    );
  }
}
