import 'package:dio/dio.dart';
import 'package:nodelabs_case/data/models/movie_model.dart';
import '../../domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final Dio dio;

  ProfileRepositoryImpl(this.dio);

  @override
  Future<List<MovieModel>> getFavoriteMovies() async {
    final response = await dio.get('/movie/favorites');
    final moviesList = (response.data['data'] as List<dynamic>?)?.map((e) => MovieModel.fromJson(e as Map<String, dynamic>)).toList() ?? [];

    return moviesList;
  }

  @override
  Future<String?> uploadProfilePhoto(String filePath) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath, filename: 'profile_photo.jpg'),
    });

    final response = await dio.post(
      '/user/upload_photo',
      data: formData,
    );

    if (response.statusCode == 200) {
      return response.data["data"]["photoUrl"];
    } else {
      throw Exception('Yükleme başarısız: ${response.statusMessage}');
    }
  }
}
