import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/shared/config/observer.dart';

class InitializationHelper {
  static Future<void> initialize() async {
    Bloc.observer = MyBlocObserver();
  }
}
