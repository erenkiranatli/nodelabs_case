part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;

  const RegisterEvent(this.email, this.password, this.name);

  @override
  List<Object> get props => [email, password, name];
}

class FetchUserProfileEvent extends AuthEvent {
  final Completer<void> completer;
  const FetchUserProfileEvent({required this.completer});
}

class UpdateProfilePhotoEvent extends AuthEvent {
  final String newPhotoUrl;

  const UpdateProfilePhotoEvent(this.newPhotoUrl);

  @override
  List<Object> get props => [newPhotoUrl];
}

class LogoutEvent extends AuthEvent {}
