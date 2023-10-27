/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/bottom-bar.svg
  String get bottomBar => 'assets/icons/bottom-bar.svg';

  /// File path: assets/icons/btn-home.svg
  String get btnHome => 'assets/icons/btn-home.svg';

  /// File path: assets/icons/btn-qr-code.svg
  String get btnQrCode => 'assets/icons/btn-qr-code.svg';

  /// File path: assets/icons/duplicate.svg
  String get duplicate => 'assets/icons/duplicate.svg';

  /// File path: assets/icons/failed.svg
  String get failed => 'assets/icons/failed.svg';

  /// File path: assets/icons/logo-white.svg
  String get logoWhite => 'assets/icons/logo-white.svg';

  /// File path: assets/icons/logo.svg
  String get logo => 'assets/icons/logo.svg';

  /// File path: assets/icons/qr-scan-withbg.svg
  String get qrScanWithbg => 'assets/icons/qr-scan-withbg.svg';

  /// File path: assets/icons/side-logo.svg
  String get sideLogo => 'assets/icons/side-logo.svg';

  /// File path: assets/icons/splash_logo.png
  AssetGenImage get splashLogo =>
      const AssetGenImage('assets/icons/splash_logo.png');

  /// File path: assets/icons/success.svg
  String get success => 'assets/icons/success.svg';

  /// File path: assets/icons/top-bar.svg
  String get topBar => 'assets/icons/top-bar.svg';

  /// List of all assets
  List<dynamic> get values => [
        bottomBar,
        btnHome,
        btnQrCode,
        duplicate,
        failed,
        logoWhite,
        logo,
        qrScanWithbg,
        sideLogo,
        splashLogo,
        success,
        topBar
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/appLogo.png
  AssetGenImage get appLogo => const AssetGenImage('assets/images/appLogo.png');

  /// File path: assets/images/splash_loader.gif
  AssetGenImage get splashLoader =>
      const AssetGenImage('assets/images/splash_loader.gif');

  /// List of all assets
  List<AssetGenImage> get values => [appLogo, splashLoader];
}

class $AssetsLocalesGen {
  const $AssetsLocalesGen();

  /// File path: assets/locales/en-US.json
  String get enUS => 'assets/locales/en-US.json';

  /// List of all assets
  List<String> get values => [enUS];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLocalesGen locales = $AssetsLocalesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
