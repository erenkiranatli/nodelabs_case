import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_case/core/di/injection.dart';
import 'package:nodelabs_case/core/extensions/context_extensions.dart';
import 'package:nodelabs_case/core/utils/snackbar_utils.dart';
import 'package:nodelabs_case/presentation/viewmodels/home_viewmodel/home_viewmodel.dart';
import 'package:nodelabs_case/presentation/widgets/home_widgets/movie_info_widget.dart';
import 'package:nodelabs_case/presentation/widgets/home_widgets/movie_page_builder_widget.dart';
import 'package:nodelabs_case/presentation/widgets/home_widgets/toggle_favorite_button_widget.dart';
import 'package:provider/provider.dart';
import '../../blocs/home_bloc/home_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewmodel(),
      child: BlocProvider(
        create: (_) => HomeBloc(homeRepository: locator())..add(FetchMoviesEvent()),
        child: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is ToggleFavError) {
              SnackbarUtils.show(
                context,
                context.loc.warning,
                context.loc.errorMessage,
              );
            }
          },
          child: Scaffold(
            body: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) => RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<HomeBloc>(context).add(RefreshMoviesEvent());
                },
                child: Stack(
                  children: [
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        return MoviePageBuilderWidget(
                          state: state,
                        );
                      },
                    ),
                    Positioned(
                      bottom: context.height * 0.13,
                      right: context.width * 0.05,
                      child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                        return (state is HomeLoaded)
                            ? ToggleFavoriteButtonWidget(
                                state: state,
                              )
                            : SizedBox();
                      }),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: context.height * 0.081,
                        width: context.width,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                      ),
                    ),
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state is HomeLoaded) {
                          return MovieInfoWidget(
                            movie: state.movies[state.currentIndex],
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
