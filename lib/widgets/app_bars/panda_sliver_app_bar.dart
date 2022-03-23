import 'package:flutter/material.dart';
import 'package:panda_flutter_ui/configs/panda_themes.dart';
import 'package:panda_flutter_ui/panda_flutter_ui.dart';

class PandaSliverAppBar extends StatelessWidget {
  ///add title text at the center of appbar
  final String title;

  ///add custom widget replacing the center of appbar
  final Widget? centerWidget;

  ///extends from flutter library
  final PreferredSizeWidget? bottom;

  ///extends from flutter library
  final Widget? flexibleSpace;

  ///extends from flutter library
  final List<Widget>? actions;

  ///extends from flutter library
  final Widget? leading;

  ///add circular border radius to bottom left and bottom right of app bar
  final bool isCircularDesign;

  ///make the appbar transparent
  final bool isTransparent;

  ///extends from flutter library
  final double? expandedHeight;

  ///extends from flutter library
  final double? collapsedHeight;

  ///add background color to the appbar,
  ///if isTransparent is set to true, this parameter will be ignored
  final Color? backgroundColor;

  ///extends from flutter library, default to true
  final bool floating;

  ///extends from flutter library, default to true
  final bool pinned;

  ///extends from flutter library, default to false
  final bool snap;

  ///extends from flutter library, default to false
  final bool stretch;

  ///extends from flutter library, default set to 0
  final double elevation;
  const PandaSliverAppBar({
    Key? key,
    this.title = '',
    this.centerWidget,
    this.bottom,
    this.flexibleSpace,
    this.actions,
    this.leading,
    this.isCircularDesign = false,
    this.isTransparent = false,
    this.expandedHeight,
    this.collapsedHeight,
    this.backgroundColor,
    this.floating = true,
    this.pinned = true,
    this.snap = false,
    this.stretch = false,
    this.elevation = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: isTransparent
          ? Colors.transparent
          : backgroundColor ?? PandaThemes.defaultTheme.backgroundColor,
      foregroundColor: PandaThemes.defaultTheme.themeColor,
      centerTitle: true,
      elevation: elevation,
      systemOverlayStyle: PandaThemes.defaultTheme.uiOverlayStyle,
      flexibleSpace: FlexibleSpaceBar(background: flexibleSpace),
      bottom: bottom,
      automaticallyImplyLeading: false,
      leading: leading,
      actions: actions,
      iconTheme: IconThemeData(color: PandaThemes.defaultTheme.themeColor),
      title: centerWidget ??
          PandaText(
            title,
            maxLines: 1,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            textColor: PandaThemes.defaultTheme.themeColor,
            isExpanded: false,
          ),
      floating: floating,
      pinned: pinned,
      snap: snap,
      stretch: false,
      expandedHeight: expandedHeight,
      collapsedHeight: collapsedHeight,
      stretchTriggerOffset: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(isCircularDesign ? 30 : 0),
          bottomRight: Radius.circular(isCircularDesign ? 30 : 0),
        ),
      ),
    );
  }
}
