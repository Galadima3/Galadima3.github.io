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
    Color? color, // 👈 Added color option
    ColorFilter? colorFilter,
    bool excludeFromSemantics = false,
    String? semanticsLabel,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    AssetBundle? bundle,
    String? package,
  }) {
    return SvgPicture.asset(
      this,
      key: key,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      matchTextDirection: matchTextDirection,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      // 👇 Use color if provided, else fall back to colorFilter
      colorFilter: color != null
          ? ColorFilter.mode(color, BlendMode.srcIn)
          : colorFilter,
      excludeFromSemantics: excludeFromSemantics,
      semanticsLabel: semanticsLabel,
      clipBehavior: clipBehavior,
      //cacheColorFilter: cacheColorFilter,
      bundle: bundle,
      package: package,
    );
  }
}
