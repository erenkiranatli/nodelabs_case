part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<MovieModel> movies;
  final int currentPage;
  final int maxPage;
  final int currentIndex;
  final bool isLoadingMore;
  final String? updatingFavoriteId; // null değilse loading göster

  const HomeLoaded({
    required this.movies,
    required this.currentPage,
    required this.maxPage,
    required this.currentIndex,
    this.isLoadingMore = false,
    this.updatingFavoriteId,
  });

  HomeLoaded copyWith({
    List<MovieModel>? movies,
    int? currentPage,
    int? maxPage,
    int? currentIndex,
    bool? isLoadingMore,
    String? updatingFavoriteId,
  }) {
    return HomeLoaded(
      movies: movies ?? this.movies,
      currentPage: currentPage ?? this.currentPage,
      maxPage: maxPage ?? this.maxPage,
      currentIndex: currentIndex ?? this.currentIndex,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      updatingFavoriteId: updatingFavoriteId,
    );
  }

  @override
  List<Object> get props => [
        movies,
        currentPage,
        maxPage,
        currentIndex,
        isLoadingMore,
        updatingFavoriteId ?? "",
      ];
}

class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object> get props => [message];
}

class ToggleFavError extends HomeState {
 
}
