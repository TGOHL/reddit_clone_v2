import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reddit_clone/screens/home/cubit/home_cubit.dart';
import 'package:reddit_clone/shared/config/styles.dart';
import 'package:reddit_clone/shared/widgets/time_player.dart';

class HomeVideoPlayer extends StatelessWidget {
  const HomeVideoPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current is HomeResizeState || current is HomeAdjustedState,
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: cubit.stretchedController.isFullScreen,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 10),
                  CircleAvatar(
                    radius: 12.w,
                    backgroundImage: AssetImage(cubit.auther.imageUrl),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'u/${cubit.auther.name}',
                    style: AppStyles.h3TextStyle,
                  ),
                ],
              ),
            ),
            Visibility(
              visible: cubit.stretchedController.isFullScreen,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 80, 12),
                child: Text(
                  cubit.post.content,
                  style: AppStyles.h3TextStyle,
                ),
              ),
            ),
            VideoTimePlayer(
              controller: cubit.controller,
              isExtened: cubit.stretchedController.isFullScreen,
            ),
          ],
        );
      },
    );
  }
}
