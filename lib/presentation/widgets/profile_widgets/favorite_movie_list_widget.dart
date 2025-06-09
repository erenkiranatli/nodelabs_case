import 'package:flutter/material.dart';
import 'package:nodelabs_case/core/constants/color_constant.dart';
import 'package:nodelabs_case/core/constants/size_const.dart';
import 'package:nodelabs_case/core/extensions/context_extensions.dart';
import 'package:nodelabs_case/core/utils/text_style_utils.dart';
import 'package:nodelabs_case/data/models/movie_model.dart';
import 'package:nodelabs_case/presentation/blocs/profile_bloc/profile_bloc.dart';

class FavoriteMovieListWidget extends StatelessWidget {
  const FavoriteMovieListWidget({super.key, required this.state});
  final ProfileLoaded state;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.height * 0.005),
      child: Column(
        children: [
          for (int i = 0; i < state.favoriteMovies.length; i += 2)
            Padding(
              padding: EdgeInsets.only(top: context.height * 0.02),
              child: Row(
                children: [
                  Expanded(
                    child: _buildMovieItem(state.favoriteMovies[i]),
                  ),
                  SizedBox(width: context.width * 0.04),
                  if (i + 1 < state.favoriteMovies.length)
                    Expanded(
                      child: _buildMovieItem(state.favoriteMovies[i + 1]),
                    )
                  else
                    Expanded(child: Container()),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMovieItem(MovieModel movie) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            width: SizeConst.width * 0.42,
            height: SizeConst.height * 0.27,
            child: Image.network(
              movie.poster,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.white.withValues(alpha: 0.5),
                child: Center(
                  child: Icon(
                    Icons.broken_image_rounded,
                    size: SizeConst.height * 0.04,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: SizeConst.height * 0.014),
        Text(
          movie.title,
          style: TextStyleUtils.generalText(fontSize: 13),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          movie.director,
          style: TextStyleUtils.generalText(fontSize: 13, color: AppColors.white50OpacityColor, fontWeight: FontWeight.w400),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
