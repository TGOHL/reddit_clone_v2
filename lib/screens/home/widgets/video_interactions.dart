import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reddit_clone/screens/home/cubit/home_cubit.dart';
import 'package:reddit_clone/shared/config/themes.dart';
import 'package:reddit_clone/shared/enums/arrow.dart';
import 'package:reddit_clone/shared/widgets/arrow_group.dart';

class HomeVideoInteractions extends StatelessWidget {
  const HomeVideoInteractions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current is HomeResizeState || current is HomeAdjustedState,
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();

        return Visibility(
          visible: cubit.stretchedController.isFullScreen,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SizedBox(
              height: 40.h,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: ArrowGroup(
                      axis: ArrowGoupAxis.HORIZONTAL,
                      hasBorders: true,
                      onChange: (delta) {
                        cubit.post.likesCount += delta;
                      },
                      likesCount: cubit.post.likesCount,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: AppThemes.lighGrey), borderRadius: BorderRadius.circular(30.w)),
                    child: IconButton(
                      onPressed: () {},
                      icon: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 4.w,
                          ),
                          const Icon(Icons.chat_bubble_outline_rounded),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 6.w,
                            ),
                            child: Text(cubit.post.commentsCount.toString()),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: AppThemes.lighGrey), borderRadius: BorderRadius.circular(30.w)),
                    child: IconButton(
                      onPressed: () {},
                      icon: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                        ),
                        child: const Icon(Icons.share),
                      ),
                    ),
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
