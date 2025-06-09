// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_case/core/constants/asset_constant.dart';
import 'package:nodelabs_case/core/constants/route_constant.dart';
import 'package:nodelabs_case/core/di/injection.dart';
import 'package:nodelabs_case/core/extensions/context_extensions.dart';
import 'package:nodelabs_case/core/services/localization_service.dart';
import 'package:nodelabs_case/core/utils/image_utils.dart';
import 'package:nodelabs_case/core/utils/snackbar_utils.dart';
import 'package:nodelabs_case/l10n/gen_l10n/app_localizations.dart';
import 'package:nodelabs_case/main.dart';
import 'package:nodelabs_case/presentation/blocs/auth_bloc/auth_bloc.dart';
import '../../blocs/splash_bloc/splash_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    LocalizationService.setLocalization(AppLocalizations.of(context)!);

    return BlocProvider(
      create: (_) => locator<SplashBloc>()..add(CheckAuthEvent()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) async {
          if (state is SplashAuthenticated) {
            try {
              final completer = Completer<void>();
              context.read<AuthBloc>().add(FetchUserProfileEvent(completer: completer));
              await completer.future;
              context.go(RouteConstants.main);
            } catch (_) {
              SnackbarUtils.show(
                context,
                context.loc.warning,
                context.loc.errorMessage,
              );
              context.go(RouteConstants.login);
            }
          } else if (state is SplashUnauthenticated) {
            context.go(RouteConstants.login);
          } else if (state is SplashError) {
            logger.error(state.message);

            SnackbarUtils.show(
              context,
              context.loc.warning,
              state.message,
            );
          }
        },
        child: Scaffold(
          body: ImageUtil.imageAsset(
            imageName: ImageAssets.splash,
            width: context.width,
            height: context.height,
            boxFit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
