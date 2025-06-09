import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nodelabs_case/core/manager/auth_token_manager.dart';
import 'package:nodelabs_case/data/models/auth_response_model.dart';
import 'package:nodelabs_case/domain/usecases/auth/fetch_user_usecase.dart';
import 'package:nodelabs_case/domain/usecases/auth/register_usecase.dart';
import 'package:nodelabs_case/main.dart';
import '../../../domain/usecases/auth/login_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final FetchUserUseCase fetchUserUseCase;
  final AuthTokenManager authTokenManager;

  AuthBloc({
    required this.loginUseCase,
    required this.authTokenManager,
    required this.registerUseCase,
    required this.fetchUserUseCase,
  }) : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
    on<FetchUserProfileEvent>(_onFetchUserProfileEvent);
    on<UpdateProfilePhotoEvent>(_onUpdateProfilePhotoEvent);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final loginResponse = await loginUseCase.execute(
        email: event.email,
        password: event.password,
      );
      await authTokenManager.saveToken(loginResponse.token);
      emit(AuthAuthenticated(user: loginResponse));
    } catch (e) {
      logger.error(e.toString());
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final loginResponse = await registerUseCase.execute(
        email: event.email,
        password: event.password,
        fullName: event.name,
      );

      await authTokenManager.saveToken(loginResponse.token);
      emit(AuthAuthenticated(user: loginResponse));
    } catch (e) {
      logger.error(e.toString());
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onFetchUserProfileEvent(FetchUserProfileEvent event, Emitter<AuthState> emit) async {
    try {
      final userProfile = await fetchUserUseCase.execute();
      await authTokenManager.saveToken(userProfile.token);
      emit(AuthAuthenticated(user: userProfile));
      event.completer.complete();
    } catch (e) {
      logger.error(e.toString());
      event.completer.completeError(e);
      emit(AuthError(e.toString()));
    }
  }

  void _onUpdateProfilePhotoEvent(UpdateProfilePhotoEvent event, Emitter<AuthState> emit) {
    if (state is AuthAuthenticated) {
      final currentState = state as AuthAuthenticated;
      final updatedUser = currentState.user.copyWith(photoUrl: event.newPhotoUrl);
      emit(AuthAuthenticated(user: updatedUser));
    }
  }
}
