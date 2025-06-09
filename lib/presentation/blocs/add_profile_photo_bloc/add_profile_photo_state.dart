part of 'add_profile_photo_bloc.dart';

abstract class AddProfilePhotoState extends Equatable {
  const AddProfilePhotoState();

  @override
  List<Object> get props => [];
}

class AddProfilePhotoInitial extends AddProfilePhotoState {}

class AddProfilePhotoLoading extends AddProfilePhotoState {}

class AddProfilePhotoSuccess extends AddProfilePhotoState {}

class AddProfilePhotoFailure extends AddProfilePhotoState {
  final String message;

  const AddProfilePhotoFailure(this.message);

  @override
  List<Object> get props => [message];
}
