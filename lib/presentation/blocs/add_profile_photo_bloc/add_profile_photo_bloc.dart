import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_profile_photo_event.dart';
part 'add_profile_photo_state.dart';

class AddProfilePhotoBloc extends Bloc<AddProfilePhotoEvent, AddProfilePhotoState> {

  AddProfilePhotoBloc() : super(AddProfilePhotoInitial());

}
