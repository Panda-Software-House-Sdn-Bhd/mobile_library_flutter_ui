import 'package:flutter/material.dart';

///To be used with panda app bar.
class PandaAppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  ///Widget for bottom appbar.
  final Widget? widget;

  ///Height for bottom.
  final double preferredHeight;
  const PandaAppBarBottom({
    Key? key,
    this.widget,
    this.preferredHeight = 0,
  }) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(preferredHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget,
    );
  }
}
