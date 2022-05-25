import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../panda_services/panda_text_format_service.dart';

class PandaText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final FontStyle fontStyle;
  final double letterSpacing;
  final TextAlign textAlign;
  final double fontSize;
  final FontWeight fontWeight;
  final String? fontFamily;
  final int maxLines;
  final bool isExpanded;
  final double textHeight;
  final TextDecoration? decoration;
  final bool useThousandSeparators;
  final bool isLoading;
  final bool isUseAutoSizeText;
  final double autoSizeTextStepGranularity;
  final double autoSizeTextMinFontSize;

  const PandaText(
    this.text, {
    Key? key,
    this.textColor,
    this.fontStyle = FontStyle.normal,
    this.letterSpacing = 0,
    this.fontSize = 15,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.start,
    this.fontFamily,
    this.maxLines = 1000,
    this.isExpanded = true,
    this.textHeight = 1.0,
    this.decoration,
    this.useThousandSeparators = false,
    this.isLoading = false,
    this.isUseAutoSizeText = false,
    this.autoSizeTextMinFontSize = 5,
    this.autoSizeTextStepGranularity = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PandaTextFormatService _textFormatService = PandaTextFormatService();
    Widget textWidget = isUseAutoSizeText
        ? AutoSizeText(
            useThousandSeparators
                ? _textFormatService.thousandSeparator(text)
                : text,
            textAlign: textAlign,
            maxLines: maxLines,
            stepGranularity: autoSizeTextStepGranularity,
            minFontSize: autoSizeTextMinFontSize,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: fontFamily,
              height: textHeight,
              color: textColor,
              fontStyle: fontStyle,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              decoration: decoration,
            ),
          )
        : Text(
            useThousandSeparators
                ? _textFormatService.thousandSeparator(text)
                : text,
            textAlign: textAlign,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: fontFamily,
              height: textHeight,
              color: textColor,
              fontStyle: fontStyle,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              decoration: decoration,
            ),
          );
    return isExpanded
        ? SizedBox(width: double.infinity, child: textWidget)
        : SizedBox(child: textWidget);
  }
}
