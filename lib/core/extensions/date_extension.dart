extension DateTimeExtension on DateTime {
  String get getWeekDayName {
    final weekdays = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ];

    return weekdays[weekday - 1];
  }
}
