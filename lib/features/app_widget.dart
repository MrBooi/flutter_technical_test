import 'package:dvt_weather_app/core/helpers/current_location_helper.dart';
import 'package:dvt_weather_app/core/shared/error_widget.dart';
import 'package:dvt_weather_app/core/shared/loading.dart';
import 'package:dvt_weather_app/features/home/presentation/home_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: determinePosition(),
      builder: (context, state) {
        if (state.hasError) {
          return const AppErrorWidget(
            errMsg: 'Please unable your location to be able to use this app.',
          );
        }
        if (state.hasData) return const HomePage();
        return const LoadingWidget();
      },
    );
  }
}
