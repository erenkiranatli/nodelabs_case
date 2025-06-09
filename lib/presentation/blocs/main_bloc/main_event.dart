part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class ChangeTabEvent extends MainEvent {
  final int index;

  const ChangeTabEvent(this.index);

  @override
  List<Object> get props => [index];
}

class ChangeLoadedProfile extends MainEvent {
  final bool loadedProfile;

  const ChangeLoadedProfile(this.loadedProfile);

  @override
  List<Object> get props => [loadedProfile];
}
