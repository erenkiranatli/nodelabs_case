import 'package:nodelabs_case/data/models/auth_response_model.dart';

abstract class AuthRepository {
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  });

  Future<AuthResponseModel> register({
    required String email,
    required String password,
    required String fullName,
  });

  Future<AuthResponseModel> fetchUser();
}
