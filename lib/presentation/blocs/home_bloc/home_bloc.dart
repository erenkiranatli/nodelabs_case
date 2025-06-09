import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nodelabs_case/core/manager/firebase_analytics_manager.dart';
import 'package:nodelabs_case/main.dart';
import '../../../data/models/movie_model.dart';
import '../../../domain/repositories/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    on<FetchMoviesEvent>(_onFetchMovies);
    on<ToggleFavoriteEvent>(_onToggleFavorite);
    on<ChangeCurrentMovieEvent>((event, emit) {
      if (state is HomeLoaded) {
        emit((state as HomeLoaded).copyWith(currentIndex: event.currentIndex));
      }
    });
    on<RefreshMoviesEvent>(_onRefreshMovies);
    on<FetchNextPageEvent>(_onFetchNextPageEvent);
  }

  Future<void> _onFetchMovies(FetchMoviesEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final movieResponse = await homeRepository.getMovies(page: event.page);
      emit(HomeLoaded(
        movies: movieResponse.movies,
        currentPage: movieResponse.pagination.currentPage,
        maxPage: movieResponse.pagination.maxPage,
        currentIndex: 0,
      ));
    } catch (e) {
      logger.error(e.toString());
      emit(HomeError(message: e.toString()));
    }
  }

  Future<void> _onToggleFavorite(ToggleFavoriteEvent event, Emitter<HomeState> emit) async {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;

      emit(currentState.copyWith(updatingFavoriteId: event.movieId));

      try {
        await homeRepository.toggleFavorite(event.movieId);

        final updatedMovies = currentState.movies.map((movie) {
          if (movie.id == event.movieId) {
            return movie.copyWith(isFavorite: !movie.isFavorite);
          }
          return movie;
        }).toList();
        FirebaseAnalyticsManager.setEventlog("toggleFavorite", {"movieId": event.movieId});
        emit(currentState.copyWith(
          movies: updatedMovies,
          updatingFavoriteId: "",
        ));
      } catch (e) {
        logger.error(e.toString());
        emit(ToggleFavError());
        emit(currentState.copyWith());
      }
    }
  }

  Future<void> _onFetchNextPageEvent(FetchNextPageEvent event, Emitter<HomeState> emit) async {
    if (state is HomeLoaded && !(state as HomeLoaded).isLoadingMore) {
      final currentState = state as HomeLoaded;

      if (currentState.currentPage >= currentState.maxPage) return;

      emit(currentState.copyWith(isLoadingMore: true));

      try {
        final nextPage = currentState.currentPage + 1;
        final response = await homeRepository.getMovies(page: nextPage);

        emit(currentState.copyWith(
          movies: [...currentState.movies, ...response.movies],
          currentPage: nextPage,
          isLoadingMore: false,
        ));
      } catch (e) {
        logger.error(e.toString());
        emit(HomeError(message: e.toString()));
      }
    }
  }

  Future<void> _onRefreshMovies(RefreshMoviesEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final movieResponse = await homeRepository.getMovies(page: 1);
      emit(HomeLoaded(
        movies: movieResponse.movies,
        currentPage: movieResponse.pagination.currentPage,
        maxPage: movieResponse.pagination.maxPage,
        currentIndex: 0,
      ));
    } catch (e) {
      logger.error(e.toString());
      emit(HomeError(message: e.toString()));
    }
  }
}
