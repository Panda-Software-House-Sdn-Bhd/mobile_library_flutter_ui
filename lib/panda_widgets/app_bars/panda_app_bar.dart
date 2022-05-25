import 'package:flutter/material.dart';
import 'panda_app_bar_bottom.dart';
import '../buttons/panda_icon_button.dart';
import '../texts/panda_text.dart';

class PandaAppBar extends StatelessWidget implements PreferredSizeWidget {
  ///App bar title.
  final String title;

  ///Center app bar widget, this will replace title.
  final Widget? centerWidget;

  ///Widget at bottom of appbar.
  final Widget? bottom;

  ///Height of widget for bottom.
  final double bottomHeight;

  ///Trailing widget list.
  final List<Widget>? actions;

  ///Leading widget, this will replace back button.
  final Widget? leading;

  ///Circular bottom appbar.
  final bool isCircularDesign;

  ///Border radius for circular bottom appbar.
  final double circularDesignBorderRadius;

  ///Background color.
  final Color? backgroundColor;

  ///Foreground color.
  final Color? foregroundColor;

  ///Make app bar transparent, this will replace background color.
  final bool isTransparent;

  ///Make title at the center.
  final bool centerTitle;

  ///Font size for title.
  final double titleFontSize;

  ///Font weight for title.
  final FontWeight titleFontWeight;

  ///Appbar elevation.
  final double elevation;

  //action when click back button
  final Function()? onBackButtonPressed;

  const PandaAppBar({
    Key? key,
    this.title = '',
    this.centerWidget,
    this.bottom,
    this.actions,
    this.leading,
    this.isCircularDesign = false,
    this.circularDesignBorderRadius = 30,
    this.isTransparent = false,
    this.bottomHeight = 0,
    this.backgroundColor,
    this.foregroundColor,
    this.centerTitle = true,
    this.titleFontSize = 17,
    this.titleFontWeight = FontWeight.bold,
    this.elevation = 0,
    this.onBackButtonPressed,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(
        (bottom == null)
            ? AppBar().preferredSize.height
            : AppBar().preferredSize.height + bottomHeight,
      );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: isTransparent ? Colors.transparent : backgroundColor,
      foregroundColor: foregroundColor,
      centerTitle: centerTitle,
      elevation: elevation,
      bottom: PandaAppBarBottom(
        preferredHeight: bottomHeight,
        widget: bottom,
      ),
      automaticallyImplyLeading: false,
      leading: Navigator.canPop(context) && leading == null
          ? PandaIconButton(
              iconData: Icons.chevron_left,
              buttonColor: foregroundColor,
              iconSize: 25,
              onPressed: onBackButtonPressed,
            )
          : leading,
      actions: actions,
      title: centerWidget ??
          (title.isNotEmpty
              ? PandaText(
                  title,
                  maxLines: 1,
                  fontSize: titleFontSize,
                  textColor: foregroundColor,
                  fontWeight: titleFontWeight,
                  isExpanded: false,
                )
              : null),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: isCircularDesign
              ? Radius.circular(circularDesignBorderRadius)
              : const Radius.circular(0),
        ),
      ),
    );
  }
}
