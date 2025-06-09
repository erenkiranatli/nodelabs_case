import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nodelabs_case/main.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState(selectedIndex: 0,loadedProfile: false)) {
    on<ChangeTabEvent>(_onChangeTab);
    on<ChangeLoadedProfile>(_onChangeLoadedProfile);
  }

  void _onChangeTab(ChangeTabEvent event, Emitter<MainState> emit) {
    emit(state.copyWith(selectedIndex: event.index));
  }

  void _onChangeLoadedProfile(ChangeLoadedProfile event, Emitter<MainState> emit) {
    logger.info("laodedProfile");
    emit(state.copyWith(loadedProfile: event.loadedProfile));
  }
}
