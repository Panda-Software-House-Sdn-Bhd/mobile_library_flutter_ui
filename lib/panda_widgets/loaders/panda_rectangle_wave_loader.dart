import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PandaRectangleWaveLoader extends StatelessWidget {
  final Color? color;
  final double? size;
  final String? localImageLoaderPath;
  final Duration loaderFullCycleDuration;

  const PandaRectangleWaveLoader({
    Key? key,
    this.color,
    this.size,
    this.localImageLoaderPath,
    this.loaderFullCycleDuration = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: localImageLoaderPath != null
          ? Image.asset(
              localImageLoaderPath!,
              width: size ?? 15.0,
              height: size ?? 15.0,
            )
          : Center(
              child: SpinKitWave(
                color: color,
                size: size ?? 15.0,
                duration: loaderFullCycleDuration,
              ),
            ),
    );
  }
}
