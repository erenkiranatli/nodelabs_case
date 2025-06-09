import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_case/data/models/movie_model.dart';
import 'package:nodelabs_case/main.dart';
import '../../../domain/repositories/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  ProfileBloc({required this.profileRepository}) : super(ProfileInitial()) {
    on<FetchFavoriteMoviesEvent>(_onFetchFavoriteMoviesEvent);
  }

  Future<void> _onFetchFavoriteMoviesEvent(FetchFavoriteMoviesEvent event, Emitter<ProfileState> emit) async {
    if (event.hasFetchedData) {
      return;
    }
    emit(ProfileLoading());
    try {
      logger.info("getFavMovies");
      final favoriteMovies = await profileRepository.getFavoriteMovies();
      emit(ProfileLoaded(favoriteMovies: favoriteMovies));
    } catch (e) {
      logger.error(e.toString());
      emit(ProfileError(e.toString()));
    }
  }
}
