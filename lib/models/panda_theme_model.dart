import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PandaThemeModel {
  SystemUiOverlayStyle uiOverlayStyle;
  Brightness brightness;
  String backgroundImageUrl;
  String authenticationBackgroundImageUrl;
  String maintenanceBackgroundImageUrl;
  String profileBannerImageUrl;
  String authenticationBannerImageUrl;
  Color imageBackgroundColor;
  Color shadowColor;
  Color dividerColor;
  Color backgroundColor;
  Color primaryColor; //light grey color
  Color primaryAccentColor; //white color
  Color themeColor; //dark blue color
  Color themeAccentColor; //white color
  Color buttonColor; //blue color
  Color buttonAccentColor; //white color
  Color quaternaryColor; //blue color
  Color quaternaryAccentColor; //white color
  Color textColor;
  Color subtitleColor;
  Color inactiveColor;
  Color disableColor;
  Color disableAccentColor;
  Color warningColor;
  Color warningAccentColor;
  Color dangerColor;
  Color dangerAccentColor;
  Color cardHighlightColor;
  Color cardSplashColor;
  //elevation
  double cardElevation;

  PandaThemeModel({
    required this.uiOverlayStyle,
    required this.brightness,
    required this.backgroundImageUrl,
    required this.authenticationBackgroundImageUrl,
    required this.maintenanceBackgroundImageUrl,
    required this.profileBannerImageUrl,
    required this.authenticationBannerImageUrl,
    required this.imageBackgroundColor,
    required this.shadowColor,
    required this.dividerColor,
    required this.backgroundColor,
    required this.primaryColor,
    required this.primaryAccentColor,
    required this.themeColor,
    required this.themeAccentColor,
    required this.buttonColor,
    required this.buttonAccentColor,
    required this.quaternaryColor,
    required this.quaternaryAccentColor,
    required this.textColor,
    required this.subtitleColor,
    required this.inactiveColor,
    required this.disableColor,
    required this.disableAccentColor,
    required this.warningColor,
    required this.warningAccentColor,
    required this.dangerColor,
    required this.dangerAccentColor,
    required this.cardHighlightColor,
    required this.cardSplashColor,
    required this.cardElevation,
  });
}
