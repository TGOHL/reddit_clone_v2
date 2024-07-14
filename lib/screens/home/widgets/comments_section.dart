import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reddit_clone/screens/home/cubit/home_cubit.dart';

class HomeCommentsSection extends StatelessWidget {
  const HomeCommentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Stack(
      children: [
        Positioned.fill(
          child: ListView(
            children: [
              Container(
                width: ScreenUtil().screenWidth,
                height: 100,
                color: Colors.green,
              ),
              Container(
                width: ScreenUtil().screenWidth,
                height: 100,
                color: Colors.grey,
              ),
              Container(
                width: ScreenUtil().screenWidth,
                height: 100,
                color: Colors.deepOrange,
              ),
              Container(
                width: ScreenUtil().screenWidth,
                height: 100,
                color: Colors.white,
              ),
              Container(
                width: ScreenUtil().screenWidth,
                height: 100,
                color: Colors.red,
              ),
              Container(
                width: ScreenUtil().screenWidth,
                height: 100,
                color: Colors.green,
              ),
              Container(
                width: ScreenUtil().screenWidth,
                height: 100,
                color: Colors.grey,
              ),
              Container(
                width: ScreenUtil().screenWidth,
                height: 100,
                color: Colors.deepOrange,
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: Container(
            width: ScreenUtil().screenWidth,
            height: 20,
            color: Colors.red,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (_, current) {
              return current is HomeResizeState;
            },
            builder: (context, state) {
              return Opacity(
                opacity: cubit.opacity,
                child: Container(
                  width: ScreenUtil().screenWidth,
                  height: 50,
                  color: Colors.white,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
