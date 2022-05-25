import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../texts/panda_text.dart';

class PandaIcon extends StatelessWidget {
  final IconData? iconData;
  final String? customSvgPath;
  final Color? color;
  final double iconSize;
  final bool isShowIndicator;
  final bool svgIgnoreAccentColor;
  final int count;
  final Color? indicatorBackgroundColor;
  final Color? indicatorAccentColor;

  const PandaIcon({
    Key? key,
    this.color,
    this.iconData,
    this.customSvgPath,
    this.iconSize = 20,
    this.svgIgnoreAccentColor = false,
    this.isShowIndicator = false,
    this.count = 0,
    this.indicatorBackgroundColor,
    this.indicatorAccentColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        customSvgPath != null
            ? SvgPicture.asset(
                customSvgPath!,
                height: iconSize,
                width: iconSize,
                color: color,
                colorBlendMode:
                    svgIgnoreAccentColor ? BlendMode.modulate : BlendMode.srcIn,
              )
            : Icon(
                iconData,
                size: iconSize,
                color: color,
              ),
        Visibility(
          visible: isShowIndicator,
          child: Positioned(
            top: 0,
            right: 0,
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: indicatorBackgroundColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        Visibility(
          visible: isShowIndicator,
          child: Positioned(
            top: 0,
            right: 0,
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: indicatorBackgroundColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        Visibility(
          visible: count != 0,
          child: Positioned(
            top: 0,
            right: 0,
            child: Container(
              height: 12,
              constraints: const BoxConstraints(
                minWidth: 12,
              ),
              decoration: BoxDecoration(
                color: indicatorBackgroundColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 0.5,
                  color: indicatorAccentColor ?? const Color(0xFF000000),
                ),
              ),
              padding: const EdgeInsets.only(
                top: 2,
                bottom: 1,
                left: 2,
                right: 2,
              ),
              child: Center(
                child: PandaText(
                  (count > 99) ? '99+' : count.toString(),
                  fontSize: 8,
                  textAlign: TextAlign.center,
                  textColor: indicatorAccentColor,
                  isExpanded: false,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
