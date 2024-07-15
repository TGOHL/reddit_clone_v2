import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/screens/home/cubit/home_cubit.dart';

class CommentsScroller extends StatelessWidget {
  const CommentsScroller({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (_, current) {
        if (current is HomeResizeState) return true;
        if (current is HomeAdjustedState) return true;
        if (current is HomeScrollEndState) return true;
        return false;
      },
      builder: (context, state) {
        if (cubit.isFullyScrolled) return const SizedBox();
        return Opacity(
          opacity: cubit.opacity,
          child: IconButton(
            onPressed: cubit.scrollToEnd,
            style: IconButton.styleFrom(backgroundColor: const Color.fromARGB(255, 31, 39, 53)),
            icon: const RotatedBox(
              quarterTurns: 3,
              child: Icon(Icons.arrow_back_ios_rounded),
            ),
          ),
        );
      },
    );
  }
}
