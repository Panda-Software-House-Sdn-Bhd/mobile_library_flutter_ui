import 'package:panda_flutter_ui/configs/panda_themes.dart';
import 'package:panda_flutter_ui/panda_flutter_ui.dart';
import 'package:flutter/material.dart';

class PandaIconButton extends StatelessWidget {
  final String? svgAssetPath; //custom svg icon
  final IconData? iconData;
  final Color? buttonColor;
  final Function()? onPressed;
  final double iconSize;
  final int count;
  final bool isShowIndicator;
  final bool isShowCircularBorder;
  final String bottomText;
  final String fontFamily;
  final EdgeInsetsGeometry? margin;

  const PandaIconButton({
    Key? key,
    this.svgAssetPath,
    this.iconData,
    this.buttonColor,
    this.onPressed,
    this.iconSize = 25,
    this.count = 0,
    this.isShowCircularBorder = false,
    this.isShowIndicator = false,
    this.margin,
    this.bottomText = '',
    this.fontFamily = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: isShowCircularBorder ? margin : EdgeInsets.zero,
            decoration: isShowCircularBorder
                ? BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: PandaThemes.defaultTheme.themeColor,
                    ),
                  )
                : null,
            child: Container(
              width: iconSize,
              height: iconSize,
              margin: isShowCircularBorder ? const EdgeInsets.all(10) : margin,
              child: IconButton(
                padding: const EdgeInsets.all(0),
                splashRadius: 20,
                splashColor: MaterialStateColor.resolveWith(
                  (states) => PandaThemes.defaultTheme.cardSplashColor,
                ),
                icon: Stack(
                  children: [
                    PandaIcon(
                      svgAssetPath: svgAssetPath,
                      iconData: iconData,
                      iconSize: iconSize,
                      color: buttonColor ?? PandaThemes.defaultTheme.themeColor,
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
                            color: PandaThemes.defaultTheme.dangerColor,
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
                            color: PandaThemes.defaultTheme.dangerColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 0.5,
                              color: PandaThemes.defaultTheme.dangerAccentColor,
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
                              textColor:
                                  PandaThemes.defaultTheme.dangerAccentColor,
                              isExpanded: false,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                onPressed: onPressed,
              ),
            ),
          ),
          Visibility(
            visible: bottomText.isNotEmpty,
            child: Column(
              children: [
                const SizedBox(height: 10),
                SizedBox(
                  height: 30,
                  child: PandaText(
                    bottomText,
                    fontFamily: fontFamily,
                    isExpanded: false,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    textColor: PandaThemes.defaultTheme.themeColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
