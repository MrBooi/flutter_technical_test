abstract class WeatherEntity {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherEntity({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherEntity &&
        other.id == id &&
        other.main == main &&
        other.description == description &&
        other.icon == icon;
  }

  @override
  int get hashCode {
    return id.hashCode ^ main.hashCode ^ description.hashCode ^ icon.hashCode;
  }

  @override
  String toString() {
    return 'WeatherEntity(id: $id, main: $main, description: $description, icon: $icon)';
  }
}
