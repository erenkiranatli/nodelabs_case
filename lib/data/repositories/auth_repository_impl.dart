import 'package:dio/dio.dart';
import 'package:nodelabs_case/main.dart';
import '../models/auth_response_model.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Dio dio;

  AuthRepositoryImpl(this.dio);

  @override
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        '/user/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return AuthResponseModel.fromJson(response.data["data"]);
      } else {
        logger.error(response.statusMessage ?? "");
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      logger.error(e.toString());
      throw Exception('Login failed');
    }
  }

  @override
  Future<AuthResponseModel> register({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      final response = await dio.post(
        '/user/register',
        data: {
          'email': email,
          'password': password,
          'name': fullName,
        },
      );

      if (response.statusCode == 200) {
        return AuthResponseModel.fromJson(response.data["data"]);
      } else {
        logger.error(response.statusMessage ?? "");

        throw Exception('Register failed');
      }
    } on DioException catch (e) {
      logger.error(e.message ?? "");
      throw Exception('Register failed: ${e.message}');
    }
  }

  @override
  Future<AuthResponseModel> fetchUser() async {
    try {
      final response = await dio.get(
        '/user/profile',
      );

      if (response.statusCode == 200) {
        return AuthResponseModel.fromJson(response.data["data"]);
      } else {
        logger.error(response.statusMessage ?? "");

        throw Exception('Fetch User failed');
      }
    } on DioException catch (e) {
      logger.error(e.message ?? "");
      throw Exception('Fetch User failed: ${e.message}');
    }
  }
}
