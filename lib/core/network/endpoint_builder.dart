class EndpointBuilder {
  static Uri uri(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return Uri(
      scheme: "https",
      host: 'api.openweathermap.org',
      path: path,
      queryParameters: queryParameters,
    );
  }
}
