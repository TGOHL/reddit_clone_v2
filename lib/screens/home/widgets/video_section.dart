import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reddit_clone/screens/home/cubit/home_cubit.dart';
import 'package:reddit_clone/screens/home/widgets/video_header.dart';
import 'package:reddit_clone/screens/home/widgets/video_interactions.dart';
import 'package:reddit_clone/screens/home/widgets/video_player.dart';
import 'package:video_player/video_player.dart';

class HomeVideoSection extends StatelessWidget {
  const HomeVideoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return Container(
      color: Colors.transparent,
      child: Stack(
        children: [
          Center(
            child: AspectRatio(
              aspectRatio: cubit.controller.value.aspectRatio,
              child: VideoPlayer(cubit.controller),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black54, Colors.transparent],
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                ),
              ),
              child: const HomeVideoHeader(),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(bottom: 8.h),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black54, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: const Column(
                children: [
                  HomeVideoPlayer(),
                  HomeVideoInteractions(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
