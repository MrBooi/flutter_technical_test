import 'package:dvt_weather_app/core/shared/loading.dart';
import 'package:dvt_weather_app/features/current_location/data/models/location_model.dart';
import 'package:dvt_weather_app/features/current_weather/presentation/cubit/current_weather_state.dart';
import 'package:dvt_weather_app/features/current_weather/presentation/current_weather_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dvt_weather_app/features/current_weather/presentation/cubit/current_weather_cubit.dart';
import 'package:dvt_weather_app/locator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<CurrentWeatherCubit>(
        create: (context) => sl<CurrentWeatherCubit>()..fetchCurrentWeather(),
        child: BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
          builder: (context, state) {
            switch (state) {
              case CurrentWeatherInitial():
                return const SizedBox(
                  child: Text('CurrentWeatherInitial'),
                );
              case CurrentWeatherLoading():
                return const LoadingWidget();
              case CurrentWeatherError():
                return const SizedBox(
                  child: Text('CurrentWeatherError'),
                );
              case CurrentWeatherLoaded():
                return const CurrentWeatherPage();
            }
          },
        ),
      ),
    );
  }
}
