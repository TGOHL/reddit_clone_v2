import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reddit_clone/generated/l10n.dart';
import 'package:reddit_clone/screens/home/cubit/home_cubit.dart';
import 'package:reddit_clone/shared/config/styles.dart';
import 'package:reddit_clone/shared/config/themes.dart';

class CommentsMessageField extends StatelessWidget {
  const CommentsMessageField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (_, current) {
        return current is HomeResizeState;
      },
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        return Opacity(
          opacity: cubit.opacity,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: AppThemes.main,
            child: Container(
              width: ScreenUtil().screenWidth,
              height: 45.h,
              color: const Color.fromARGB(127, 49, 49, 49),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: AppStyles.h4TextStyle,
                      cursorColor: AppThemes.fontMain,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                        hintText: S.current.add_comment,
                        hintStyle: AppStyles.hintTextStyle,
                        border: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: const Icon(
                        Icons.tag_faces_outlined,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: const Icon(
                        Icons.gif_box_outlined,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: const Icon(
                        Icons.image_outlined,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
