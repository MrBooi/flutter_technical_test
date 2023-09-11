import 'package:flutter/material.dart';

class CopyText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;
  const CopyText(
    this.text, {
    super.key,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow = TextOverflow.ellipsis,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textHeightBehavior: textHeightBehavior,
      textAlign: textAlign,
      textScaleFactor: textScaleFactor,
      textDirection: textDirection,
      textWidthBasis: textWidthBasis,
      locale: locale,
      softWrap: softWrap,
      maxLines: maxLines,
      selectionColor: selectionColor,
      style: style,
      strutStyle: strutStyle,
    );
  }
}
