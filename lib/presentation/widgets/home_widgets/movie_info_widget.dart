import 'package:flutter/material.dart';
import 'package:nodelabs_case/core/constants/asset_constant.dart';
import 'package:nodelabs_case/core/constants/color_constant.dart';
import 'package:nodelabs_case/core/extensions/context_extensions.dart';
import 'package:nodelabs_case/core/extensions/string_extensions.dart';
import 'package:nodelabs_case/core/utils/button_utils.dart';
import 'package:nodelabs_case/core/utils/image_utils.dart';
import 'package:nodelabs_case/core/utils/text_style_utils.dart';
import 'package:nodelabs_case/data/models/movie_model.dart';

class MovieInfoWidget extends StatelessWidget {
  const MovieInfoWidget({super.key, required this.movie});
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: context.height * 0.04,
      left: context.width * 0.08,
      right: context.width * 0.02,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: context.height * 0.005),
            width: context.width * 0.1,
            height: context.width * 0.1,
            decoration: BoxDecoration(
              color: const Color(0xFFE50914),
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 1.5,
              ),
            ),
            child: Center(
              child: ImageUtil.svgAsset(
                svgName: SvgAssets.movieTempImage,
              ),
            ),
          ),
          SizedBox(width: context.width * 0.04),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: context.width * 0.75,
                child: Text(
                  movie.title,
                  style: TextStyleUtils.generalText(
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: context.height * 0.001),
              SizedBox(
                width: context.width * 0.75,
                child: ButtonUtils().richTextButton(
                  startText: movie.plot.truncateByWord(70),
                  clickableText: context.loc.more,
                  nonClickTextColor: AppColors.white75OpacityColor,
                  fontWeight: FontWeight.w700,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
