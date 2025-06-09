import '../../../data/models/auth_response_model.dart';
import '../../repositories/auth_repository.dart';

class FetchUserUseCase {
  final AuthRepository repository;

  FetchUserUseCase(this.repository);

  Future<AuthResponseModel> execute() async {
    return await repository.fetchUser();
  }
}
