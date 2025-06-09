import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nodelabs_case/core/constants/color_constant.dart';
import 'package:nodelabs_case/core/constants/size_const.dart';
import 'package:nodelabs_case/core/di/injection.dart';
import 'package:nodelabs_case/core/manager/auth_token_manager.dart';
import 'package:nodelabs_case/core/routes/app_router.dart';
import 'package:nodelabs_case/core/services/logger/console_logger.dart';
import 'package:nodelabs_case/core/services/logger/firebase_logger.dart';
import 'package:nodelabs_case/core/services/logger/logger_service.dart';
import 'package:nodelabs_case/domain/usecases/auth/fetch_user_usecase.dart';
import 'package:nodelabs_case/domain/usecases/auth/login_usecase.dart';
import 'package:nodelabs_case/domain/usecases/auth/register_usecase.dart';
import 'package:nodelabs_case/l10n/gen_l10n/app_localizations.dart';
import 'package:nodelabs_case/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

late LoggerService logger;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setup();
  SizeConst.initSize();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  if (kDebugMode) {
    logger = ConsoleLogger();
  } else {
    logger = FirebaseLogger();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      child: Builder(
        builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<AuthBloc>(
                create: (_) => AuthBloc(
                  loginUseCase: locator<LoginUseCase>(),
                  registerUseCase: locator<RegisterUseCase>(),
                  authTokenManager: locator<AuthTokenManager>(),
                  fetchUserUseCase: locator<FetchUserUseCase>(),
                ),
              ),
            ],
            child: MaterialApp.router(
              theme: ThemeData(
                useMaterial3: true,
                textSelectionTheme: TextSelectionThemeData(
                  selectionColor: AppColors.white20OpacityColor,
                  selectionHandleColor: AppColors.white20OpacityColor,
                  cursorColor: AppColors.white20OpacityColor,
                ),
                colorSchemeSeed: Colors.white,
              ),
              title: "SINFLIX",
              debugShowCheckedModeBanner: false,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales,
              routerConfig: router,
            ),
          );
        },
      ),
    );
  }
}
