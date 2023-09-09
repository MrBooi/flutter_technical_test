import 'package:dvt_weather_app/core/external_services.dart';
import 'package:dvt_weather_app/features/current_weather/current_weather_service.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;
Future<void> initServices() async {
  // currentWeatherServices
  currentWeatherServices();

  //  core

  // External
  externalServices();
}
