import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:panda_flutter_ui/configs/panda_themes.dart';

class PandaLoader extends StatelessWidget {
  final Color? color;
  final double? size;

  const PandaLoader({
    Key? key,
    this.color,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Center(
        child: SpinKitThreeBounce(
          color: color ?? PandaThemes.defaultTheme.themeColor,
          size: size ?? 15.0,
          duration: const Duration(milliseconds: 500),
        ),
      ),
    );
  }
}
