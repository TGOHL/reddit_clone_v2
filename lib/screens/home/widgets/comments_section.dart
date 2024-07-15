import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reddit_clone/screens/home/cubit/home_cubit.dart';
import 'package:reddit_clone/screens/home/widgets/comments_dragger.dart';
import 'package:reddit_clone/screens/home/widgets/comments_header.dart';
import 'package:reddit_clone/screens/home/widgets/comments_message_field.dart';
import 'package:reddit_clone/screens/home/widgets/comments_moderator_mod.dart';
import 'package:reddit_clone/screens/home/widgets/comments_scroller.dart';
import 'package:reddit_clone/screens/home/widgets/comments_sorter.dart';
import 'package:reddit_clone/shared/widgets/ad_container.dart';
import 'package:reddit_clone/shared/widgets/comment_tile.dart';

class HomeCommentsSection extends StatelessWidget {
  const HomeCommentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Stack(
      children: [
        Positioned.fill(
          child: ListView(
            padding: EdgeInsets.only(top: 20.h, bottom: 45.h),
            controller: cubit.scrollController,
            children: [
              const CommentsHeader(),
              SizedBox(height: 8.h),
              AdContainer(adModel: cubit.ad),
              const CommentsSorter(),
              CommentsModeratorMod(
                date: cubit.post.date,
                points: 1,
              ),
              SizedBox(height: 8.h),
              ...cubit.post.comments.map((e) => CommentTile(comment: e, autherId: cubit.post.autherId)),
            ],
          ),
        ),
        const Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: CommentsDragger(),
        ),
        Positioned(
          bottom: 0.w,
          right: 0.w,
          left: 0.w,
          child: const CommentsMessageField(),
        ),
        Positioned(
          bottom: 100.h,
          right: 8.w,
          child: const CommentsScroller(),
        ),
      ],
    );
  }
}
