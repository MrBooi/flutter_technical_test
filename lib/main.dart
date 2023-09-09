import 'package:dvt_weather_app/core/theme/theme.dart';
import 'package:dvt_weather_app/features/home/presentation/home_page.dart';
import 'package:dvt_weather_app/locator.dart' as di;
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Setup the dependency injection.
  await di.initServices();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      home: const HomePage(),
    );
  }
}
