import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_case/core/constants/asset_constant.dart';
import 'package:nodelabs_case/core/constants/color_constant.dart';
import 'package:nodelabs_case/core/extensions/context_extensions.dart';
import 'package:nodelabs_case/core/utils/image_utils.dart';
import 'package:nodelabs_case/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:nodelabs_case/presentation/blocs/main_bloc/main_bloc.dart';
import 'package:provider/provider.dart';

class ToggleFavoriteButtonWidget extends StatelessWidget {
  const ToggleFavoriteButtonWidget({super.key, required this.state});
  final HomeLoaded state;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: InkWell(
          overlayColor: WidgetStatePropertyAll(Colors.transparent),
          onTap: () {
            context.read<HomeBloc>().add(
                  ToggleFavoriteEvent(movieId: state.movies[state.currentIndex].id),
                );
            context.read<MainBloc>().add(
                  ChangeLoadedProfile(false),
                );
          },
          child: Container(
            height: context.height * 0.084,
            width: context.width * 0.12,
            decoration: BoxDecoration(
              color: AppColors.black20OpacityColor,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: AppColors.white20OpacityColor,
                width: 1,
              ),
            ),
            child: Center(
              child: ImageUtil.svgAsset(
                svgName: SvgAssets.favorite,
                height: context.height * 0.022,
                color: state.movies[state.currentIndex].isFavorite ? AppColors.mainRedColor : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
