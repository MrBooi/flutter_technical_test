import 'package:dvt_weather_app/features/current_location/domain/entities/location_entity.dart';

class LocationModel extends LocationEntity {
  LocationModel({
    required super.latitude,
    required super.longitude,
  });
}
