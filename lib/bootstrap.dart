import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dvt_weather_app/locator.dart' as di;

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
   WidgetsFlutterBinding.ensureInitialized();


  // Setup the dependency injection.
  await di.initServices();

  runApp(await builder());
}