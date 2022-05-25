import 'package:flutter/material.dart';
import '../icons/panda_icon.dart';

class PandaIconButton extends StatelessWidget {
  final IconData? iconData;
  final String? customSvgPath;
  final Color? buttonColor;
  final Function()? onPressed;
  final double iconSize;
  final int count;
  final bool isShowIndicator;

  const PandaIconButton({
    Key? key,
    this.iconData,
    this.customSvgPath,
    this.buttonColor,
    this.onPressed,
    this.iconSize = 25,
    this.count = 0,
    this.isShowIndicator = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(0),
      splashRadius: 20,
      icon: PandaIcon(
        iconData: iconData,
        customSvgPath: customSvgPath,
        iconSize: iconSize,
        color: buttonColor,
        isShowIndicator: isShowIndicator,
        count: count,
      ),
      onPressed: onPressed,
    );
  }
}
