import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/screens/home/widgets/comments_section.dart';
import 'package:reddit_clone/screens/home/widgets/video_section.dart';
import 'package:reddit_clone/shared/config/themes.dart';
import 'package:reddit_clone/shared/helpers/toast_helper.dart';
import 'package:reddit_clone/shared/widgets/stretched_container.dart';

import 'cubit/home_cubit.dart';

part 'home_view.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..init(),
      child: BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeErrorState) {
            ToastHelper.of(context).showError(state.error.toString());
          }
        },
        child: const HomeView(),
      ),
    );
  }
}
