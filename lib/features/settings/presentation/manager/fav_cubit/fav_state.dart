part of 'fav_cubit.dart';

@immutable
sealed class GetFavState {}

final class GetFavInitial extends GetFavState {}


class GetFavLoadingState extends GetFavState {}

class GetFavSuccessState extends GetFavState {
  final List<GetFavourite> favModels;

  GetFavSuccessState({required this.favModels});
}

class GetFavErrorState extends GetFavState {
  final String error;

  GetFavErrorState(this.error);
}
