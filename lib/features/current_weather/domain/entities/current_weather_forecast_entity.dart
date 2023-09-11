// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dvt_weather_app/features/current_weather/data/models/forecast_weather_item_model.dart';
import 'package:flutter/foundation.dart';

import 'package:dvt_weather_app/features/current_weather/domain/entities/forecast_weather_item_entity.dart';

abstract class CurrentWeatherForecastEntity {
  final List<ForecastWeatherItemEntity> list;

  CurrentWeatherForecastEntity({required this.list});

  List<ForecastWeatherItemModel> get getFilteredList {
    Map<String, ForecastWeatherItemModel> uniqueItems = {};
    for (var item in list) {
      String currentDate = item.dtTxt.substring(0, 10);
      uniqueItems[currentDate] = item as ForecastWeatherItemModel;
    }

    return uniqueItems.values.toList();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CurrentWeatherForecastEntity &&
        listEquals(other.list, list);
  }

  @override
  int get hashCode => list.hashCode;
}
