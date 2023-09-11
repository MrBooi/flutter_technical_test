import 'package:flutter/material.dart';

class MediaQueryHelpers {
  static double screenWidth(BuildContext context, {double multiplier = 1}) {
    return MediaQuery.sizeOf(context).height * multiplier;
  }

  static double screenHeight(BuildContext context, {double multiplier = 1}) {
    return MediaQuery.sizeOf(context).height * multiplier;
  }
}
