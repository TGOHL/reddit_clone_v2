part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeInitializedState extends HomeState {}

class HomeScrollEndState extends HomeState {}

class HomeResizeState extends HomeState {}

class HomeAdjustedState extends HomeState {}

class HomeErrorState extends HomeState {
  final Exception error;

  HomeErrorState(this.error);
}
