/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsColorGen {
  const $AssetsColorGen();

  /// File path: assets/color/colors.xml
  String get colors => 'assets/color/colors.xml';

  /// List of all assets
  List<String> get values => [colors];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/apple.svg
  String get apple => 'assets/icons/apple.svg';

  /// File path: assets/icons/arrow_back.svg
  String get arrowBack => 'assets/icons/arrow_back.svg';

  /// File path: assets/icons/arrow_bottom.svg
  String get arrowBottom => 'assets/icons/arrow_bottom.svg';

  /// File path: assets/icons/arrow_right.svg
  String get arrowRight => 'assets/icons/arrow_right.svg';

  /// File path: assets/icons/baby.svg
  String get baby => 'assets/icons/baby.svg';

  /// File path: assets/icons/brain.svg
  String get brain => 'assets/icons/brain.svg';

  /// File path: assets/icons/congratulation.svg
  String get congratulation => 'assets/icons/congratulation.svg';

  /// File path: assets/icons/date_of_birth.svg
  String get dateOfBirth => 'assets/icons/date_of_birth.svg';

  /// File path: assets/icons/editProfile.svg
  String get editProfile => 'assets/icons/editProfile.svg';

  /// File path: assets/icons/feet.svg
  String get feet => 'assets/icons/feet.svg';

  /// File path: assets/icons/google.svg
  String get google => 'assets/icons/google.svg';

  /// File path: assets/icons/heart.svg
  String get heart => 'assets/icons/heart.svg';

  /// File path: assets/icons/heart1.svg
  String get heart1 => 'assets/icons/heart1.svg';

  /// File path: assets/icons/home_menu.svg
  String get homeMenu => 'assets/icons/home_menu.svg';

  /// File path: assets/icons/mail.svg
  String get mail => 'assets/icons/mail.svg';

  /// File path: assets/icons/menu.svg
  String get menu => 'assets/icons/menu.svg';

  /// File path: assets/icons/menu_icon.svg
  String get menuIcon => 'assets/icons/menu_icon.svg';

  /// File path: assets/icons/notification.svg
  String get notification => 'assets/icons/notification.svg';

  /// File path: assets/icons/process_payment.svg
  String get processPayment => 'assets/icons/process_payment.svg';

  /// File path: assets/icons/right_icon.svg
  String get rightIcon => 'assets/icons/right_icon.svg';

  /// File path: assets/icons/sparm.svg
  String get sparm => 'assets/icons/sparm.svg';

  /// File path: assets/icons/stepper.svg
  String get stepper => 'assets/icons/stepper.svg';

  /// List of all assets
  List<String> get values => [
        apple,
        arrowBack,
        arrowBottom,
        arrowRight,
        baby,
        brain,
        congratulation,
        dateOfBirth,
        editProfile,
        feet,
        google,
        heart,
        heart1,
        homeMenu,
        mail,
        menu,
        menuIcon,
        notification,
        processPayment,
        rightIcon,
        sparm,
        stepper
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/cocooil.png
  AssetGenImage get cocooil => const AssetGenImage('assets/images/cocooil.png');

  /// File path: assets/images/cosmetics.png
  AssetGenImage get cosmetics =>
      const AssetGenImage('assets/images/cosmetics.png');

  /// File path: assets/images/img1.png
  AssetGenImage get img1 => const AssetGenImage('assets/images/img1.png');

  /// File path: assets/images/phone.png
  AssetGenImage get phone => const AssetGenImage('assets/images/phone.png');

  /// File path: assets/images/productImg1.png
  AssetGenImage get productImg1 =>
      const AssetGenImage('assets/images/productImg1.png');

  /// File path: assets/images/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/images/profile.png');

  /// File path: assets/images/splash_screen.png
  AssetGenImage get splashScreen =>
      const AssetGenImage('assets/images/splash_screen.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [cocooil, cosmetics, img1, phone, productImg1, profile, splashScreen];
}

class Assets {
  Assets._();

  static const $AssetsColorGen color = $AssetsColorGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
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
