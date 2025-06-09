import 'package:nodelabs_case/data/models/movie_model.dart';


class FavoriteMoviesResponseModel {
  final List<MovieModel> movies;

  FavoriteMoviesResponseModel({
    required this.movies,
  });

  factory FavoriteMoviesResponseModel.fromJson(Map<String, dynamic> json) {
    final moviesList = (json['movies'] as List<dynamic>?)?.map((e) => MovieModel.fromJson(e as Map<String, dynamic>)).toList() ?? [];

    return FavoriteMoviesResponseModel(movies: moviesList);
  }
}
