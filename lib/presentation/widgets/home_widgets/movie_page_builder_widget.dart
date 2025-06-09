import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_case/core/constants/color_constant.dart';
import 'package:nodelabs_case/core/extensions/context_extensions.dart';
import 'package:nodelabs_case/core/utils/loading_utils.dart';
import 'package:nodelabs_case/presentation/blocs/home_bloc/home_bloc.dart';

class MoviePageBuilderWidget extends StatelessWidget {
  const MoviePageBuilderWidget({super.key, required this.state});
  final HomeState state;
  @override
  Widget build(BuildContext context) {
    return state is HomeLoaded
        ? PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: (state as HomeLoaded).movies.length,
            onPageChanged: (value) {
              context.read<HomeBloc>().add(ChangeCurrentMovieEvent(value));
              if (value >= (state as HomeLoaded).movies.length - 2) {
                context.read<HomeBloc>().add(FetchNextPageEvent());
              }
            },
            itemBuilder: (context, index) {
              final movie = (state as HomeLoaded).movies[index];

              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    movie.poster,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.black.withValues(alpha: 0.5),
                      child: Center(
                        child: Icon(
                          Icons.broken_image_rounded,
                          size: context.height * 0.08,
                          color: AppColors.backgroundColor,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          )
        : LoadingUtils();
  }
}
