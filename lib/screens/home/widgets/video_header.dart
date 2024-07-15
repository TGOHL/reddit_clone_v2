import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reddit_clone/screens/home/cubit/home_cubit.dart';

class HomeVideoHeader extends StatelessWidget {
  const HomeVideoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current is HomeResizeState || current is HomeAdjustedState,
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        return Visibility(
          visible: cubit.stretchedController.isFullScreen,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.close_rounded,
                  size: 24.w,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 10.w,
                    backgroundImage: AssetImage(cubit.auther.imageUrl),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    "r/",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(cubit.post.reddit),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
              ),
            ],
          ),
        );
      },
    );
  }
}
