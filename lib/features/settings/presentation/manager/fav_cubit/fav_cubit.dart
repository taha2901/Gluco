import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:gluco/core/widgets/network.dart';
import 'package:gluco/features/settings/data/get_favourite/get_favourite.dart';
import 'package:meta/meta.dart';

part 'fav_state.dart';

class GetFavCubit extends Cubit<GetFavState> {
  GetFavCubit() : super(GetFavInitial());

  static GetFavCubit get(context) => BlocProvider.of(context);

  void getFavourites() {
    emit(GetFavLoadingState());
    DioHelper().getData(url: 'Favorites/AddFavoriteDoctor', token: 'Bearer $userToken').then((value) {
      List<GetFavourite> favModels = (value.data as List)
          .map((fav) => GetFavourite.fromJson(fav))
          .toList();
      emit(GetFavSuccessState(favModels: favModels));
    }).catchError((onError) {
      emit(GetFavErrorState(onError.toString()));
    });
  }
}
