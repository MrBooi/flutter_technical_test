import 'package:dvt_weather_app/core/shared/copy_text.dart';
import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final String errMsg;
  const AppErrorWidget({super.key, required this.errMsg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CopyText(
            errMsg,
          )
        ],
      ),
    );
  }
}
