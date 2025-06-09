// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nodelabs_case/core/extensions/context_extensions.dart';
import 'package:nodelabs_case/core/utils/snackbar_utils.dart';
import 'package:nodelabs_case/presentation/blocs/auth_bloc/auth_bloc.dart';
import '../../../domain/repositories/profile_repository.dart';

class AddProfilePhotoViewModel extends ChangeNotifier {
  final ProfileRepository profileRepository;

  String? selectedImagePath;
  bool isLoading = false;

  AddProfilePhotoViewModel(this.profileRepository);

  void selectImage(String path) {
    selectedImagePath = path;
    notifyListeners();
  }

  Future<void> uploadProfilePhoto(BuildContext context) async {
    if (selectedImagePath == null) return;

    isLoading = true;
    notifyListeners();

    try {
      var newPhotoUrl = await profileRepository.uploadProfilePhoto(selectedImagePath!);
      if (newPhotoUrl == null) {
        return;
      }
      context.read<AuthBloc>().add(UpdateProfilePhotoEvent(newPhotoUrl));

      isLoading = false;
      notifyListeners();
      SnackbarUtils.show(context, context.loc.info, context.loc.photoUploadSuccess, isError: false);
      context.pop();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      SnackbarUtils.show(
        context,
        context.loc.warning,
        e.toString(),
      );
    }
  }
}
