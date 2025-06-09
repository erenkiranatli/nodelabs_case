import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_case/presentation/views/home/home_view.dart';
import 'package:nodelabs_case/presentation/views/profile/profile_view.dart';
import 'package:nodelabs_case/presentation/widgets/main_widgets/bottom_nav_bar_widget.dart';
import '../../blocs/main_bloc/main_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainBloc(),
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return SafeArea(
            top: false,
            child: Scaffold(
              body: IndexedStack(
                index: state.selectedIndex,
                children: [
                  const HomeView(),
                  if (state.selectedIndex == 1 || state.loadedProfile) const ProfileView() else const SizedBox(),
                ],
              ),
              bottomNavigationBar: BottomNavBarWidget(
                currentIndex: state.selectedIndex,
                onTap: (index) {
                  context.read<MainBloc>().add(ChangeTabEvent(index));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
