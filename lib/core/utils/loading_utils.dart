import 'package:flutter/material.dart';
import 'package:nodelabs_case/core/constants/asset_constant.dart';
import 'package:nodelabs_case/core/extensions/context_extensions.dart';
import 'package:nodelabs_case/core/utils/image_utils.dart';

// ignore: must_be_immutable
class LoadingUtils extends StatelessWidget {
  LoadingUtils({super.key, this.onlyLottie = false});
  bool onlyLottie;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: onlyLottie ? context.height * 0.09 : context.height,
      width: onlyLottie ? context.height * 0.09 : context.width,
      color: onlyLottie ? Colors.transparent : Colors.black.withValues(alpha: 0.5),
      child: Center(
        child: ImageUtil.lottieAsset(
          lottieName: JsonAssets.loading,
          height: context.height * 0.09,
          width: context.height * 0.09,
        ),
      ),
    );
  }
}
