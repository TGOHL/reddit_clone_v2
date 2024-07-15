import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reddit_clone/generated/l10n.dart';
import 'package:reddit_clone/shared/config/themes.dart';

class CommentsSorter extends StatelessWidget {
  const CommentsSorter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.w),
      color: AppThemes.mainLight,
      child: Row(
        children: [
          const Icon(Icons.sort),
          Padding(
            padding: EdgeInsets.all(4.w),
            child: Text(S.current.best_comments),
          ),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}
