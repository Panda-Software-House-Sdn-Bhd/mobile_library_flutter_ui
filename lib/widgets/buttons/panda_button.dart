import 'package:flutter/material.dart';
import 'package:panda_flutter_ui/configs/panda_themes.dart';
import 'package:panda_flutter_ui/enums.dart';
import 'package:panda_flutter_ui/widgets/icons/panda_icon.dart';
import 'package:panda_flutter_ui/widgets/loaders/panda_loader.dart';
import 'package:panda_flutter_ui/widgets/texts/panda_text.dart';

class PandaButton extends StatelessWidget {
  final PandaButtonSize buttonSize;
  final String buttonLabel;
  final Color? color;
  final Color? accentColor;
  final Color? borderColor;
  final String? svgAssetPath;
  final IconData? iconData;
  final double circularBorderRadiusValue;
  final BorderRadius? borderRadius;
  final Function()? onPressed;
  final bool isLoading;
  final bool isExpanded;
  final double? elevation;
  final double? buttonHeight;
  final double? fontSize;
  final double? iconSize;
  final double? loaderSize;
  final bool isCircleButton;
  final bool panda4IconIgnoreAccentColor;
  final EdgeInsets? padding;
  final bool isTransparentSplashEffect;
  const PandaButton({
    Key? key,
    required this.buttonSize,
    this.buttonLabel = '',
    this.color,
    this.accentColor,
    this.borderColor,
    required this.onPressed,
    this.circularBorderRadiusValue = 10,
    this.borderRadius,
    this.svgAssetPath = '',
    this.iconData,
    this.isLoading = false,
    this.isExpanded = false,
    this.elevation,
    this.fontSize,
    this.buttonHeight,
    this.iconSize,
    this.loaderSize,
    this.isCircleButton = false,
    this.panda4IconIgnoreAccentColor = false,
    this.padding,
    this.isTransparentSplashEffect = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final double elevation;
    late final double fontSize;
    late final double buttonHeight;
    late final double iconSize;
    late final double loaderSize;
    //circle button
    late final double circleButtonBorderRadius;
    late final double circleButtonSize;
    late final double circleButtonIconSize;
    if (buttonSize == PandaButtonSize.large) {
      elevation = this.elevation ?? 0;
      fontSize = this.fontSize ?? 15;
      buttonHeight = this.buttonHeight ?? 35;
      iconSize = this.iconSize ?? 12;
      loaderSize = this.loaderSize ?? 12;
      //circle button
      circleButtonIconSize = this.iconSize ?? 20;
      circleButtonBorderRadius = 40;
      circleButtonSize = 55;
    } else if (buttonSize == PandaButtonSize.medium) {
      elevation = this.elevation ?? 0;
      fontSize = this.fontSize ?? 12;
      buttonHeight = this.buttonHeight ?? 20;
      iconSize = this.iconSize ?? 15;
      loaderSize = this.loaderSize ?? 12;
      //circle button
      circleButtonIconSize = this.iconSize ?? 18;
      circleButtonBorderRadius = 40;
      circleButtonSize = 40;
    } else if (buttonSize == PandaButtonSize.small) {
      elevation = this.elevation ?? 0;
      fontSize = this.fontSize ?? 10;
      buttonHeight = this.buttonHeight ?? 11;
      iconSize = this.iconSize ?? 10;
      loaderSize = this.loaderSize ?? 10;
      //circle button
      circleButtonIconSize = this.iconSize ?? 12;
      circleButtonBorderRadius = 40;
      circleButtonSize = 30;
    }
    return IgnorePointer(
      ignoring: isLoading,
      child: ElevatedButton(
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
          padding: MaterialStateProperty.resolveWith<EdgeInsets>(
              (Set<MaterialState> states) {
            return const EdgeInsets.all(0);
          }),
          overlayColor: MaterialStateColor.resolveWith(
            (states) => isTransparentSplashEffect
                ? Colors.transparent
                : PandaThemes.defaultTheme.cardSplashColor,
          ),
          side: MaterialStateProperty.resolveWith<BorderSide>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return BorderSide(
                color: PandaThemes.defaultTheme.disableColor,
              );
            } else {
              return BorderSide(
                color: borderColor ?? PandaThemes.defaultTheme.buttonColor,
              );
            }
          }),
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
              (Set<MaterialState> states) {
            return RoundedRectangleBorder(
              borderRadius: isCircleButton
                  ? BorderRadius.circular(circleButtonBorderRadius)
                  : borderRadius ??
                      BorderRadius.circular(circularBorderRadiusValue),
            );
          }),
          elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
              return elevation;
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return accentColor ??
                    PandaThemes.defaultTheme.buttonAccentColor;
              }
              if (states.contains(MaterialState.disabled)) {
                return PandaThemes.defaultTheme.disableAccentColor;
              }
              return accentColor ?? PandaThemes.defaultTheme.buttonAccentColor;
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return color ?? PandaThemes.defaultTheme.buttonColor;
              }
              if (states.contains(MaterialState.disabled)) {
                return PandaThemes.defaultTheme.disableColor;
              }
              return color ?? PandaThemes.defaultTheme.buttonColor;
            },
          ),
          minimumSize: MaterialStateProperty.resolveWith<Size>(
            (Set<MaterialState> states) {
              return isCircleButton
                  ? Size(circleButtonSize, circleButtonSize)
                  : const Size(10, 10);
            },
          ),
        ),
        child: isCircleButton
            ? PandaIcon(
                svgAssetPath: svgAssetPath,
                iconData: iconData,
                color: onPressed == null
                    ? PandaThemes.defaultTheme.disableAccentColor
                    : accentColor ?? PandaThemes.defaultTheme.buttonAccentColor,
                iconSize: circleButtonIconSize,
                panda4IconIgnoreAccentColor: panda4IconIgnoreAccentColor,
              )
            : Container(
                height: buttonHeight,
                width: isExpanded ? double.infinity : null,
                margin: padding ??
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: !isLoading
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PandaText(
                            buttonLabel,
                            textColor: onPressed == null
                                ? PandaThemes.defaultTheme.disableAccentColor
                                : accentColor ??
                                    PandaThemes.defaultTheme.buttonAccentColor,
                            fontWeight: FontWeight.w700,
                            //letterSpacing: 0.5,
                            fontSize: fontSize,
                            isExpanded: false,
                          ),
                          iconData != null
                              ? Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: PandaIcon(
                                    iconData: iconData,
                                    svgAssetPath: svgAssetPath,
                                    color: accentColor ??
                                        PandaThemes
                                            .defaultTheme.buttonAccentColor,
                                    iconSize: iconSize,
                                    panda4IconIgnoreAccentColor:
                                        panda4IconIgnoreAccentColor,
                                  ),
                                )
                              : Container(),
                        ],
                      )
                    : Center(
                        child: PandaLoader(
                          size: loaderSize,
                          color: onPressed == null
                              ? PandaThemes.defaultTheme.disableAccentColor
                              : accentColor ??
                                  PandaThemes.defaultTheme.buttonAccentColor,
                        ),
                      ),
              ),
        onPressed: onPressed,
      ),
    );
  }
}
