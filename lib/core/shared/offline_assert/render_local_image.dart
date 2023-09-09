import 'package:flutter/widgets.dart';

class RenderLocalImage extends StatelessWidget {
  final String fileName;

  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;

  const RenderLocalImage({
    required this.fileName,
    this.fit = BoxFit.cover,
    this.height = 300.0,
    this.width,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ext = fileName.split('.').last.toLowerCase();

    return ext == 'svg'
        ? const SizedBox.shrink()
        : Image.asset(
            fileName,
            width: width,
            height: height,
            fit: fit,
            color: color,
          );
  }
}
