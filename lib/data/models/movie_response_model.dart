import 'movie_model.dart';
import 'pagination_model.dart';

class MovieResponseModel {
  final List<MovieModel> movies;
  final PaginationModel pagination;

  MovieResponseModel({
    required this.movies,
    required this.pagination,
  });

  factory MovieResponseModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};
    final moviesList = (data['movies'] as List<dynamic>?)?.map((e) => MovieModel.fromJson(e)).toList() ?? [];
    final pagination = data['pagination'] != null ? PaginationModel.fromJson(data['pagination']) : PaginationModel(totalCount: 0, perPage: 0, maxPage: 0, currentPage: 0);

    return MovieResponseModel(
      movies: moviesList,
      pagination: pagination,
    );
  }
}
