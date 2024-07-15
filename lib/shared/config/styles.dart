import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reddit_clone/shared/config/themes.dart';

class AppStyles {
  static const TextStyle toastTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: Colors.white,
  );
  static TextStyle h1TextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20.sp,
    color: AppThemes.fontMain,
  );
  static TextStyle h2TextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: AppThemes.fontMain,
  );
  static TextStyle h3TextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: AppThemes.fontMain,
  );
  static TextStyle h4TextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    color: AppThemes.fontMain,
  );
  static TextStyle h5TextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 10.sp,
    color: AppThemes.fontMain,
  );
  static TextStyle hintTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: AppThemes.fontSecondary,
  );
}
