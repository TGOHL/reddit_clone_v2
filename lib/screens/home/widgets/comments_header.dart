import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reddit_clone/shared/config/styles.dart';
import 'package:reddit_clone/shared/config/themes.dart';
import 'package:timeago/timeago.dart';
import 'package:reddit_clone/screens/home/cubit/home_cubit.dart';

class CommentsHeader extends StatelessWidget {
  const CommentsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Container(
      color: AppThemes.mainLight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 10),
                Image.asset(
                  cubit.auther.imageUrl,
                  width: 36.w,
                  height: 36.w,
                ),
                SizedBox(width: 6.w),
                Text(
                  'u/${cubit.auther.name} ∙ ',
                  style: AppStyles.h3TextStyle.copyWith(fontWeight: FontWeight.w700),
                ),
                Text(
                  format(cubit.post.date, locale: 'en_short'),
                  style: AppStyles.h3TextStyle.copyWith(fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w, bottom: 8.h),
            child: Text(
              cubit.post.content,
              style: AppStyles.h2TextStyle.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
