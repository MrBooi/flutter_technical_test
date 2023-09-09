import 'package:dvt_weather_app/core/theme/theme.dart';
import 'package:flutter/widgets.dart';

enum DisplayType { current, min, max }

class WeatherDisplayItem extends StatelessWidget {
  final double temp;
  final DisplayType type;
  const WeatherDisplayItem({
    super.key,
    required this.temp,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            "${temp.toString()}\u00b0",
            style: AppTheme.themeData.textTheme.displaySmall,
          ),
        ),
        Text(
          type.name,
          style: AppTheme.themeData.textTheme.bodySmall,
        )
      ],
    );
  }
}
