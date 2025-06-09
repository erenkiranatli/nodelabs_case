part of 'main_bloc.dart';

// ignore: must_be_immutable
class MainState extends Equatable {
  final int selectedIndex;
  final bool loadedProfile ;
  const MainState({required this.selectedIndex, required this.loadedProfile });

  MainState copyWith({int? selectedIndex, bool? loadedProfile}) {
    return MainState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      loadedProfile: loadedProfile?? this.loadedProfile,
    );
  }

  @override
  List<Object> get props => [selectedIndex, loadedProfile];
}
