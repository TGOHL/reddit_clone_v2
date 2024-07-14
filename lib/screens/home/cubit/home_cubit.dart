import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reddit_clone/shared/models/app/post.dart';
import 'package:reddit_clone/shared/models/user/app_user.dart';
import 'package:reddit_clone/shared/services/local/database.dart';
import 'package:reddit_clone/shared/widgets/stretched_container.dart';
import 'package:video_player/video_player.dart';

import '../../../shared/models/exeptions/went_wrong.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  late VideoPlayerController _controller;
  late StretchedController _stretchedController;
  VideoPlayerController get controller => _controller;
  StretchedController get stretchedController => _stretchedController;
  bool get isInitialized => _controller.value.isInitialized;

  Post get post => DatabaseService().getPost();
  AppUser get auther => DatabaseService().getUserById(post.ownerId);

  double opacity = 0.0;
  HomeCubit() : super(HomeInitial());

  Future init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      _controller = VideoPlayerController.networkUrl(Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
        ..setLooping(true)
        ..initialize().then((_) {
          _stretchedController = StretchedController(
            minimum: ScreenUtil().screenWidth / _controller.value.aspectRatio,
            maximum: ScreenUtil().screenHeight - ScreenUtil().statusBarHeight,
          );
          _controller.play();
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          emit(HomeInitializedState());
        });
    } on Exception catch (e) {
      emit(HomeErrorState(e));
    } catch (e) {
      emit(HomeErrorState(WentWrongExeption()));
    }
  }

  void setOpacity(double scrollRatio) {
    if ((opacity - scrollRatio).abs() > 0.05) {
      if (scrollRatio < .15) {
        opacity = 0;
      } else {
        opacity = (scrollRatio - 0.15) / 0.85;
      }
      emit(HomeResizeState());
    }
  }

  void onScreenAdjusted() {
    emit(HomeAdjustedState());
  }
}
