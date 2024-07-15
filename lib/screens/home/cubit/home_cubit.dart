import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reddit_clone/shared/config/assets.dart';
import 'package:reddit_clone/shared/models/app/ad.dart';
import 'package:reddit_clone/shared/models/app/post.dart';
import 'package:reddit_clone/shared/models/exeptions/went_wrong.dart';
import 'package:reddit_clone/shared/models/user/app_user.dart';
import 'package:reddit_clone/shared/services/local/database.dart';
import 'package:reddit_clone/shared/widgets/stretched_container.dart';
import 'package:video_player/video_player.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  late VideoPlayerController _controller;
  late StretchedController _stretchedController;
  VideoPlayerController get controller => _controller;
  StretchedController get stretchedController => _stretchedController;
  bool get isInitialized {
    try {
      return _controller.value.isInitialized;
    } catch (e) {
      return false;
    }
  }

  Post get post => DatabaseService().getPost();
  AppUser get auther => DatabaseService().getUserById(post.autherId);

  AdModel get ad => AdModel(
        title: 'gelatoconnects',
        content: 'Looking to scale your business? 🚀 Design personalization made easy: Gelato Platinum',
        siteUrl: 'gelato.com',
        logoUrl: AppAssets.AD_LOGO,
        imageUrl: AppAssets.AD_IMAGE,
      );
  double opacity = 0.0;
  HomeCubit() : super(HomeInitial());

  late ScrollController scrollController;

  bool isFullyScrolled = false;

  void checkCommentsSectionPositon() {
    if (isFullyScrolled != (scrollController.position.maxScrollExtent == scrollController.offset)) {
      isFullyScrolled = scrollController.position.maxScrollExtent == scrollController.offset;
      emit(HomeScrollEndState());
    }
  }

  @override
  Future<void> close() {
    scrollController.removeListener(checkCommentsSectionPositon);
    _controller.dispose();
    scrollController.dispose();
    return super.close();
  }

  Future init() async {
    try {
      scrollController = ScrollController();
      scrollController.addListener(checkCommentsSectionPositon);
      WidgetsFlutterBinding.ensureInitialized();
      _controller = VideoPlayerController.networkUrl(Uri.parse(post.attachmentUrl))
        ..setLooping(true)
        ..initialize().then((_) {
          _stretchedController = StretchedController(
            minimum: ScreenUtil().screenWidth * 9 / 16,
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

  void scrollToEnd() async {
    await scrollController.animateTo(
      scrollController.position.extentTotal,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    isFullyScrolled = true;
    emit(HomeScrollEndState());
  }
}
