part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final Photos data;
  HomeSuccess({required this.data});
}

class HomeError extends HomeState {
  final dynamic error;
  HomeError({required this.error});
}
