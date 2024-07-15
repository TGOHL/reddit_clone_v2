import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reddit_clone/shared/config/themes.dart';
import 'package:reddit_clone/shared/widgets/line.dart';

class CommentsDragger extends StatelessWidget {
  const CommentsDragger({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      height: 24.h,
      alignment: Alignment.center,
      color: Colors.black,
      child: Container(
        width: ScreenUtil().screenWidth,
        height: 24.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: AppThemes.mainLight, borderRadius: BorderRadius.vertical(top: Radius.circular(12.h))),
        child: const Line(
          width: 36,
          height: 3,
          roundConrners: true,
          color: Colors.white,
        ),
      ),
    );
  }
}
