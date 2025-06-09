part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class FetchMoviesEvent extends HomeEvent {
  final int page;

  const FetchMoviesEvent({this.page = 1});

  @override
  List<Object> get props => [page];
}

class ToggleFavoriteEvent extends HomeEvent {
  final String movieId;

  const ToggleFavoriteEvent({
    required this.movieId,
  });

  @override
  List<Object> get props => [movieId];
}

class ChangeCurrentMovieEvent extends HomeEvent {
  final int currentIndex;

  const ChangeCurrentMovieEvent(this.currentIndex);

  @override
  List<Object> get props => [currentIndex];
}

class FetchNextPageEvent extends HomeEvent {}

class RefreshMoviesEvent extends HomeEvent {}


