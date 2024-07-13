import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/models/exeptions/went_wrong.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {

  HomeCubit(

  ) : super(HomeInitial());

  Future init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();

    } on Exception catch (e) {
      emit(HomeErrorState(e));
    } catch (e) {
      emit(HomeErrorState(WentWrongExeption()));
    }
  }
}
