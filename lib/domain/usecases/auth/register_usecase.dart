import '../../../data/models/auth_response_model.dart';
import '../../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<AuthResponseModel> execute({
    required String email,
    required String password,
    required String fullName,
  }) async {
    return await repository.register(
      email: email,
      password: password,
      fullName: fullName,
    );
  }
}
