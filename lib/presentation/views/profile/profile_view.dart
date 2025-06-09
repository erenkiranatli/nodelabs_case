import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_case/core/constants/asset_constant.dart';
import 'package:nodelabs_case/core/constants/color_constant.dart';
import 'package:nodelabs_case/core/di/injection.dart';
import 'package:nodelabs_case/core/extensions/context_extensions.dart';
import 'package:nodelabs_case/core/utils/app_header_utils.dart';
import 'package:nodelabs_case/core/utils/button_utils.dart';
import 'package:nodelabs_case/core/utils/image_utils.dart';
import 'package:nodelabs_case/core/utils/loading_utils.dart';
import 'package:nodelabs_case/core/utils/text_style_utils.dart';
import 'package:nodelabs_case/domain/repositories/profile_repository.dart';
import 'package:nodelabs_case/presentation/blocs/main_bloc/main_bloc.dart';
import 'package:nodelabs_case/presentation/viewmodels/profile_viewmodel/profile_viewmodel.dart';
import 'package:nodelabs_case/presentation/widgets/profile_widgets/favorite_movie_list_widget.dart';
import 'package:nodelabs_case/presentation/widgets/profile_widgets/no_favorite_movie_widget.dart';
import 'package:nodelabs_case/presentation/widgets/profile_widgets/user_profile_info_widget.dart';
import 'package:provider/provider.dart';
import '../../blocs/profile_bloc/profile_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileViewModel(),
      child: Consumer<ProfileViewModel>(
        builder: (context, viewModel, child) {
          return BlocProvider<ProfileBloc>(
            create: (context) {
              var loadedProfile = BlocProvider.of<MainBloc>(context).state.loadedProfile;
              BlocProvider.of<MainBloc>(context).add(ChangeLoadedProfile(true));
              return ProfileBloc(profileRepository: locator<ProfileRepository>())
                ..add(
                  FetchFavoriteMoviesEvent(
                    loadedProfile,
                  ),
                );
            },
            child: Scaffold(
              backgroundColor: AppColors.backgroundColor,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppHeaderUtils().buildHeader(
                        title: context.loc.profileDetail,
                        onTap: () {
                          context.read<MainBloc>().add(ChangeTabEvent(0));
                        },
                        trailing: ButtonUtils().defaultElevatedButton(
                          height: context.height * 0.035,
                          width: context.width * 0.25,
                          text: context.loc.limitedOffer,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          onTap: () {
                            viewModel.showPremiumModal(context);
                          },
                          leading: Padding(
                            padding: EdgeInsets.only(
                              right: context.width * 0.012,
                            ),
                            child: ImageUtil.svgAsset(
                              svgName: SvgAssets.premium,
                              height: context.height * 0.015,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: context.width * 0.06, right: context.width * 0.06),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UserProfileInfoWidget(),
                            Padding(
                              padding: EdgeInsets.only(top: context.height * 0.035),
                              child: Text(
                                context.loc.favoriteMovies,
                                style: TextStyleUtils.generalText(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            BlocBuilder<ProfileBloc, ProfileState>(
                              builder: (context, state) {
                                if (state is ProfileLoading) {
                                  return Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: context.height * 0.1),
                                      child: LoadingUtils(
                                        onlyLottie: true,
                                      ),
                                    ),
                                  );
                                } else if (state is ProfileLoaded) {
                                  if (state.favoriteMovies.isEmpty) {
                                    return NoFavoriteMovieWidget();
                                  }
                                  return FavoriteMovieListWidget(
                                    state: state,
                                  );
                                } else {
                                  return NoFavoriteMovieWidget();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
