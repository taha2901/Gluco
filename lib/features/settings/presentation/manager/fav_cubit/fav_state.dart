part of 'fav_cubit.dart';

@immutable
sealed class FavState {}

final class GetFavInitial extends FavState {}


class GetFavLoadingState extends FavState {}

class GetFavSuccessState extends FavState {
  final List<GetFavourite> favModels;

  GetFavSuccessState({required this.favModels});
}

class GetFavErrorState extends FavState {
  final String error;

  GetFavErrorState(this.error);
}

class AddFavLoadingState extends FavState {}

class AddFavSuccessState extends FavState {

  AddFavSuccessState();
}

class AddFavErrorState extends FavState {
  final String error;

  AddFavErrorState(this.error);
}
