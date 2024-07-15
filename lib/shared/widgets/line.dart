import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Line extends StatelessWidget {
  final double height;
  final double width;
  final Color? color;
  final bool roundConrners;
  const Line({
    super.key,
    this.height = 1,
    this.width = 130,
    this.color,
    this.roundConrners = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        borderRadius: roundConrners ? BorderRadius.circular(width.w) : null,
        color: color ?? Colors.grey[600],
      ),
    );
  }
}
