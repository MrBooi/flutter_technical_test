import 'package:dvt_weather_app/bootstrap.dart';
import 'package:dvt_weather_app/core/theme/theme.dart';
import 'package:dvt_weather_app/features/app_widget.dart';
import 'package:flutter/material.dart';

void main() async {
  await bootstrap(() => const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      home: const AppWidget(),
    );
  }
}
