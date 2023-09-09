import 'package:dvt_weather_app/locator.dart';
import 'package:http/http.dart' as http;

void externalServices() {
  // Http
  sl.registerLazySingleton(() => http.Client());
}
