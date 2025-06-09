import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nodelabs_case/core/manager/auth_token_manager.dart';
import 'package:nodelabs_case/data/repositories/auth_repository_impl.dart';
import 'package:nodelabs_case/data/repositories/home_reposirtory_impl.dart';
import 'package:nodelabs_case/data/repositories/profile_repository_impl.dart';
import 'package:nodelabs_case/domain/repositories/auth_repository.dart';
import 'package:nodelabs_case/domain/repositories/home_repository.dart';
import 'package:nodelabs_case/domain/repositories/profile_repository.dart';
import 'package:nodelabs_case/domain/usecases/auth/fetch_user_usecase.dart';
import 'package:nodelabs_case/domain/usecases/auth/login_usecase.dart';
import 'package:nodelabs_case/domain/usecases/auth/register_usecase.dart';
import 'package:nodelabs_case/presentation/blocs/main_bloc/main_bloc.dart';
import 'package:nodelabs_case/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:nodelabs_case/presentation/blocs/splash_bloc/splash_bloc.dart';

final locator = GetIt.instance;

void setup() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://caseapi.servicelabs.tech',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );
  final authTokenManager = AuthTokenManager();

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      final token = await authTokenManager.getToken();
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      return handler.next(options);
    },
  ));

  locator.registerLazySingleton<Dio>(() => dio);

  locator.registerLazySingleton(() => SplashBloc(authTokenManager: locator()));

  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(locator<Dio>()),
  );
  locator.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(locator<Dio>()),
  );
  locator.registerLazySingleton(() => AuthTokenManager());
  locator.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(locator<AuthRepository>()),
  );
  locator.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(locator<AuthRepository>()),
  );
  locator.registerLazySingleton<FetchUserUseCase>(
    () => FetchUserUseCase(locator<AuthRepository>()),
  );

  locator.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(locator<Dio>()),
  );
  locator.registerFactory(() => MainBloc());

locator.registerLazySingleton(() => ProfileBloc(profileRepository: locator<ProfileRepository>()));
}
