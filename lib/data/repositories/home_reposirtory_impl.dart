import 'package:dio/dio.dart';
import '../../data/models/movie_response_model.dart';
import '../../domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final Dio dio;

  HomeRepositoryImpl(this.dio);

  @override
  Future<MovieResponseModel> getMovies({int page = 1}) async {
    try {
      final response = await dio.get(
        '/movie/list',
        queryParameters: {'page': page},
      );

      if (response.statusCode == 200) {
        return MovieResponseModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load movies');
      }
    } on DioException catch (e) {
      throw Exception('Failed: ${e.message}');
    }
  }

  @override
  Future<bool> toggleFavorite(String movieId) async {
    try {
      final response = await dio.post(
        '/movie/favorite/$movieId',
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception('Failed: ${e.message}');
    }
  }
}
