import 'package:go_router/go_router.dart';
import 'package:nodelabs_case/core/constants/route_constant.dart';
import 'package:nodelabs_case/presentation/views/add_profile_photo/add_profile_photo_view.dart';
import 'package:nodelabs_case/presentation/views/home/home_view.dart';
import 'package:nodelabs_case/presentation/views/main/main_view.dart';
import 'package:nodelabs_case/presentation/views/splash/splash_view.dart';
import '../../presentation/views/login/login_view.dart';
import '../../presentation/views/register/register_view.dart';

final GoRouter router = GoRouter(
  initialLocation: RouteConstants.splash,
  routes: [
    GoRoute(
      path: RouteConstants.splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: RouteConstants.login,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: RouteConstants.register,
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      path: RouteConstants.home,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: RouteConstants.main,
      builder: (context, state) => const MainView(),
    ),
    GoRoute(
      path: RouteConstants.addProfilePhoto,
      builder: (context, state) => const AddProfilePhotoView(),
    ),
  ],
);
