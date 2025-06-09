
import 'package:nodelabs_case/data/models/movie_model.dart';

abstract class ProfileRepository {
  Future<List<MovieModel>> getFavoriteMovies();
  Future<String?> uploadProfilePhoto(String file);
}
