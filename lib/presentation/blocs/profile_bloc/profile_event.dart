part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class FetchFavoriteMoviesEvent extends ProfileEvent {
  bool hasFetchedData = false;
  FetchFavoriteMoviesEvent(this.hasFetchedData);
}
