import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:photo_view/photo_view.dart';
import '../loaders/panda_circular_wave_loader.dart';

class PandaImage extends StatelessWidget {
  final String? remoteImageUrl;
  final String? watermarkImageUrl;
  final String? localImagePath;
  final FilterQuality filterQuality;
  final BoxFit fit;
  final Widget? errorWidget;
  final double? width;
  final double? height;
  final Color backgroundColor;
  final BorderRadius? borderRadius;
  final bool? isGreyImage;
  final bool isZoomableImage;
  final bool isLoaderVisible;
  final Widget? loader;
  const PandaImage({
    Key? key,
    this.remoteImageUrl,
    this.watermarkImageUrl,
    this.localImagePath,
    this.width,
    this.height,
    this.filterQuality = FilterQuality.high,
    this.fit = BoxFit.contain,
    this.backgroundColor = Colors.transparent,
    this.errorWidget,
    this.borderRadius,
    this.isGreyImage = false,
    this.isZoomableImage = false,
    this.isLoaderVisible = true,
    this.loader,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _networkImage = CachedNetworkImage(
      imageUrl: remoteImageUrl ?? '',
      fit: fit,
      width: width,
      height: height,
      filterQuality: filterQuality,
      progressIndicatorBuilder: (context, url, downloadProgress) => Visibility(
        visible: isLoaderVisible,
        child: Center(
          child: loader ?? const PandaCircularWaveLoader(size: 10),
        ),
      ),
      errorWidget: (context, url, error) => errorWidget ?? Container(),
    );

    Widget _watermarkImage = CachedNetworkImage(
      imageUrl: watermarkImageUrl ?? '',
      fit: fit,
      width: width,
      height: height,
      filterQuality: filterQuality,
      errorWidget: (context, url, error) => errorWidget ?? Container(),
    );

    ColorFilter _greyColorFilter = const ColorFilter.matrix(<double>[
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ]);

    Widget _image = localImagePath != null
        ? Image.asset(
            localImagePath ?? '',
            //File(localImagePath!).readAsBytesSync(),
            fit: fit,
            width: width,
            height: height,
            filterQuality: filterQuality,
          )
        : isZoomableImage
            ? PhotoView.customChild(
                minScale: 1.0,
                maxScale: 2.0,
                backgroundDecoration: BoxDecoration(
                  color: backgroundColor,
                ),
                child: _networkImage,
              )
            : _networkImage;

    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: Container(
        color: backgroundColor,
        child: ColorFiltered(
          colorFilter: isGreyImage ?? false
              ? _greyColorFilter
              : const ColorFilter.mode(
                  Colors.transparent,
                  BlendMode.multiply,
                ),
          child: (watermarkImageUrl != null)
              ? Stack(
                  fit: StackFit.passthrough,
                  children: [
                    _image,
                    _watermarkImage,
                  ],
                )
              : _image,
        ),
      ),
    );
  }
}
