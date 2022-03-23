import 'package:flutter/material.dart';
import 'package:panda_flutter_ui/configs/panda_themes.dart';
import 'package:panda_flutter_ui/services/text_view_service.dart';

class PandaText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final String? fontFamily;
  final FontStyle fontStyle;
  final double letterSpacing;
  final TextAlign textAlign;
  final double fontSize;
  final FontWeight fontWeight;
  final int maxLines;
  final bool isExpanded;
  final double textHeight;
  final TextDecoration? decoration;
  final bool useThousandSeparators;

  const PandaText(
    this.text, {
    Key? key,
    this.textColor,
    this.fontFamily,
    this.fontStyle = FontStyle.normal,
    this.letterSpacing = 0,
    this.fontSize = 15,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.start,
    this.maxLines = 1000,
    this.isExpanded = true,
    this.textHeight = 1.0,
    this.decoration,
    this.useThousandSeparators = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget textWidget = Text(
      useThousandSeparators ? TextViewService().thousandSeparator(text) : text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        height: textHeight,
        color: textColor ?? PandaThemes.defaultTheme.textColor,
        fontStyle: fontStyle,
        fontFamily: fontFamily,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        decoration: decoration,
      ),
    );
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: isExpanded
          ? SizedBox(
              width: double.infinity,
              child: textWidget,
            )
          : SizedBox(child: textWidget),
    );
  }
}
