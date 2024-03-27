import 'package:flutter/material.dart';
import '../icons/panda_icon.dart';
import '../texts/panda_text.dart';

class PandaButton extends StatelessWidget {
  ///Text label for button.
  final String buttonLabel;

  ///Background color for button.
  final Color? color;

  ///Foreground color for button.
  final Color? accentColor;

  ///Button border color.
  final Color? borderColor;

  ///icon
  final IconData? iconData;

  ///svg image.
  final String? svgPath;

  //icon at the left of label
  final bool isLeadingIcon;

  ///Circle button border radius.
  ///Only applied for circular button.
  final double circleButtonBorderRadius;

  ///Button border radius.
  ///Does not applied to circular button.
  final double borderRadius;

  ///Button on pressed action.
  final Function()? onPressed;

  ///Determine whether button fill the whole parent width or not.
  ///Does not applied to circular button.
  final bool isExpanded;

  ///Button elevation.
  final double? elevation;

  ///Height of button.
  ///Does not applied to circular button.
  final double buttonHeight;

  ///Circular button size.
  ///Only applied to circular button.
  final double circleButtonSize;

  ///Font size for button.
  ///Does not apply to circular button.
  final double fontSize;

  ///Icon size for button.
  final double iconSize;

  ///Set to true to use the circle style button.
  final bool isCircleButton;

  ///Minimum height for button.
  ///Does not apply to circular button.
  final double minimumHeight;

  ///Minimum width for button.
  ///Does not apply to circular button.
  final double minimumWidth;

  ///Use the svg image original color.
  ///Otherwise will be overwrite accent color.
  final bool svgIgnoreAccentColor;

  ///Button inner padding.
  ///Does not apply to circular button.
  final EdgeInsets padding;

  ///Button label font weight.
  final FontWeight fontWeight;

  const PandaButton({
    Key? key,
    this.buttonLabel = '',
    this.color,
    this.accentColor,
    this.borderColor,
    required this.onPressed,
    this.circleButtonBorderRadius = 40,
    this.borderRadius = 10,
    this.iconData,
    this.svgPath,
    this.isLeadingIcon = false,
    this.isExpanded = false,
    this.elevation,
    this.fontSize = 15,
    this.buttonHeight = 25,
    this.iconSize = 20,
    this.circleButtonSize = 55,
    this.isCircleButton = false,
    this.svgIgnoreAccentColor = false,
    this.minimumWidth = 10,
    this.minimumHeight = 10,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 15,
    ),
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _borderColor = (borderColor == null ||
            ((borderColor?.value ?? 0) == (color?.value ?? 0)))
        ? Colors.transparent
        : borderColor ?? Colors.transparent;
    final Widget _circleButtonIcon = iconData != null || svgPath != null
        ? PandaIcon(
            iconData: iconData,
            customSvgPath: svgPath,
            color: onPressed == null ? accentColor : accentColor,
            iconSize: iconSize,
            svgIgnoreAccentColor: svgIgnoreAccentColor,
          )
        : Container();
    final Widget _leadingIcon = iconData != null || svgPath != null
        ? PandaIcon(
            iconData: iconData,
            customSvgPath: svgPath,
            color: onPressed == null ? accentColor : accentColor,
            iconSize: iconSize,
            svgIgnoreAccentColor: svgIgnoreAccentColor,
          )
        : Container();
    final Widget _trailingIcon = iconData != null || svgPath != null
        ? PandaIcon(
            iconData: iconData,
            customSvgPath: svgPath,
            color: onPressed == null ? accentColor : accentColor,
            iconSize: iconSize,
            svgIgnoreAccentColor: svgIgnoreAccentColor,
          )
        : Container();
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: accentColor,
        backgroundColor: color,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: isCircleButton
              ? BorderRadius.circular(circleButtonBorderRadius)
              : BorderRadius.circular(borderRadius),
        ),
        side: BorderSide(
          color: _borderColor,
          width: 1,
        ),
        minimumSize: isCircleButton
            ? Size(circleButtonSize, circleButtonSize)
            : Size(minimumWidth, minimumHeight),
      ),
      child: isCircleButton
          ? Container(
              child: _circleButtonIcon,
            )
          : Container(
              height: buttonHeight,
              constraints: BoxConstraints(
                minWidth: minimumWidth,
              ),
              width: isExpanded ? double.infinity : null,
              margin: padding,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (iconData != null && isLeadingIcon)
                    Container(
                      margin: EdgeInsets.only(
                        right: (buttonLabel.isNotEmpty) ? 10 : 0,
                      ),
                      child: _leadingIcon,
                    ),
                  if ((buttonLabel.isNotEmpty))
                    PandaText(
                      buttonLabel,
                      textColor: onPressed == null
                          ? ThemeData.light().disabledColor
                          : accentColor,
                      fontWeight: fontWeight,
                      fontSize: fontSize,
                      isExpanded: false,
                    ),
                  if (iconData != null && !isLeadingIcon)
                    Container(
                      margin: EdgeInsets.only(
                        left: (buttonLabel.isNotEmpty) ? 10 : 0,
                      ),
                      child: _trailingIcon,
                    ),
                ],
              ),
            ),
      onPressed: onPressed,
    );
  }
}
