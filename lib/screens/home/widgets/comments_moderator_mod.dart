import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reddit_clone/generated/l10n.dart';
import 'package:reddit_clone/shared/config/themes.dart';
import 'package:timeago/timeago.dart';

class CommentsModeratorMod extends StatelessWidget {
  final DateTime date;
  final int points;
  const CommentsModeratorMod({super.key, required this.date, required this.points});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      color: AppThemes.main,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(4.w),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
            child: const Icon(
              Icons.shield_rounded,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 4.w),
          Text(S.current.auto_moderator),
          SizedBox(width: 4.w),
          Text(
            S.current.mod,
            style: const TextStyle(color: Colors.green),
          ),
          SizedBox(width: 4.w),
          const Icon(
            Icons.shield_rounded,
            color: Colors.white,
          ),
          Text(' ∙ ${format(date, locale: 'en_short')} ∙ $points ${S.current.points}'),
          const Spacer(),
          Transform.rotate(
            angle: 45 * pi / 180,
            child: const Icon(
              Icons.push_pin,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
