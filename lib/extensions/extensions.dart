import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


extension SvgAssetPathExtension on String {
 
  SvgPicture asSvgAsset({
    Key? key,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool matchTextDirection = false,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    ColorFilter? colorFilter,
    bool excludeFromSemantics = false,
    String? semanticsLabel,
    Clip clipBehavior = Clip.hardEdge, // Default from SvgPicture.asset
    bool cacheColorFilter = false, // Default from SvgPicture.asset
    AssetBundle? bundle,
    String? package,
  }) {
    return SvgPicture.asset(
      this, // 'this' refers to the String (asset path) on which the extension is called
      key: key,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      matchTextDirection: matchTextDirection,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      colorFilter: colorFilter,
      excludeFromSemantics: excludeFromSemantics,
      semanticsLabel: semanticsLabel,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      bundle: bundle,
      package: package,
    );
  }
}