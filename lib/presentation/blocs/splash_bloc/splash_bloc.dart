import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nodelabs_case/core/manager/auth_token_manager.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthTokenManager authTokenManager;

  SplashBloc({required this.authTokenManager}) : super(SplashInitial()) {
    on<CheckAuthEvent>(_onCheckAuth);
  }

  Future<void> _onCheckAuth(CheckAuthEvent event, Emitter<SplashState> emit) async {
    emit(SplashLoading());
    try {
      final token = await authTokenManager.getToken();
      if (token != null && token.isNotEmpty) {
        emit(SplashAuthenticated());
      } else {
        emit(SplashUnauthenticated());
      }
    } catch (e) {
      emit(SplashError(e.toString()));
    }
  }
}
