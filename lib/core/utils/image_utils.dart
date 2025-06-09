import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class ImageUtil {
  static Image imageAsset({required String imageName, double? height, double? width, BoxFit? boxFit}) {
    return Image.asset(
      imageName,
      width: width,
      height: height,
      fit: boxFit ?? BoxFit.contain,
    );
  }

  static SvgPicture svgAsset({required String svgName, double? height, double? width, Color? color}) {
    return SvgPicture.asset(
      svgName,
      height: height,
      width: width,
      // ignore: deprecated_member_use
      color: color,
      fit: BoxFit.contain,
    );
  }

  static LottieBuilder lottieAsset({required String lottieName, double? height, double? width, bool? repeat, bool? animate}) {
    return Lottie.asset(
      lottieName,
      height: height,
      width: width,
      fit: BoxFit.fitWidth,
      frameRate: const FrameRate(60),
      repeat: repeat,
      animate: animate,
    );
  }
}
