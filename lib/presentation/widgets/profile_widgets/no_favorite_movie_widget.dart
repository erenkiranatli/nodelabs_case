import 'package:flutter/material.dart';
import 'package:nodelabs_case/core/constants/asset_constant.dart';
import 'package:nodelabs_case/core/extensions/context_extensions.dart';
import 'package:nodelabs_case/core/utils/image_utils.dart';
import 'package:nodelabs_case/core/utils/text_style_utils.dart';

class NoFavoriteMovieWidget extends StatelessWidget {
  const NoFavoriteMovieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: context.height * 0.06),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageUtil.lottieAsset(
                lottieName: JsonAssets.empty,
                height: context.height * 0.1,
                repeat: false,
              ),
              SizedBox(
                width: context.width * 0.5,
                child: Text(
                  context.loc.noFavoriteMovies,
                  style: TextStyleUtils.generalText(fontSize: 14, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ));
  }
}
