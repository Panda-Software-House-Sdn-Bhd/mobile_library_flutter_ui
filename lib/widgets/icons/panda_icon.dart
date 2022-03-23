import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:panda_flutter_ui/configs/panda_themes.dart';

class PandaIcon extends StatelessWidget {
  final String? svgAssetPath;
  final IconData? iconData;
  final Color? color;
  final double? iconSize;
  final bool panda4IconIgnoreAccentColor;

  const PandaIcon({
    Key? key,
    this.svgAssetPath,
    this.color,
    this.iconData,
    this.iconSize,
    this.panda4IconIgnoreAccentColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return svgAssetPath != null
        ? SvgPicture.asset(
            svgAssetPath!,
            height: iconSize ?? 20.0,
            width: iconSize,
            color: color ?? PandaThemes.defaultTheme.themeColor,
            colorBlendMode: panda4IconIgnoreAccentColor
                ? BlendMode.modulate
                : BlendMode.srcIn,
          )
        : Icon(
            iconData,
            size: iconSize,
            color: color ?? PandaThemes.defaultTheme.themeColor,
          );
  }
}
