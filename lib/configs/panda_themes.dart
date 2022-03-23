import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:panda_flutter_ui/models/panda_theme_model.dart';

class PandaThemes {
  static PandaThemeModel defaultTheme = PandaThemeModel(
    uiOverlayStyle: SystemUiOverlayStyle.dark,
    brightness: Brightness.light,
    backgroundImageUrl: '',
    authenticationBackgroundImageUrl: '',
    maintenanceBackgroundImageUrl: '',
    profileBannerImageUrl: '',
    authenticationBannerImageUrl: '',
    imageBackgroundColor: const Color(0xffE6E9F0),
    shadowColor: const Color(0xffffffff),
    dividerColor: const Color(0xffb5b5b5),
    primaryColor: const Color(0xffEFF0F2),
    primaryAccentColor: const Color(0xffFFFFFF),
    themeColor: const Color(0xff40456E),
    themeAccentColor: const Color(0xffFFFFFF),
    buttonColor: const Color(0xff6699CD),
    buttonAccentColor: const Color(0xffFFFFFF),
    quaternaryColor: const Color(0xffffd952),
    quaternaryAccentColor: const Color(0xff545454),
    inactiveColor: const Color(0xffBCBCC3),
    disableColor: const Color(0xffd9d9d9),
    disableAccentColor: const Color(0xffFFFFFF),
    backgroundColor: const Color(0xffFFFFFF),
    textColor: const Color(0xff545454),
    subtitleColor: const Color(0xff8c8c8c),
    warningColor: Colors.orange,
    warningAccentColor: Colors.white,
    dangerColor: const Color(0xffff596d),
    dangerAccentColor: const Color(0xffFFFFFF),
    cardHighlightColor: const Color(0xffb8dbff),
    cardSplashColor: const Color(0xff99c4f0),
    cardElevation: 3,
  );
}
