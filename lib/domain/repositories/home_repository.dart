import '../../data/models/movie_response_model.dart';

abstract class HomeRepository {
  Future<MovieResponseModel> getMovies({int page = 1});
  Future<void> toggleFavorite(String movieId);
}
