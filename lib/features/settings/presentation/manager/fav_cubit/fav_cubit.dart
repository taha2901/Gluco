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

  List<GetFavourite> favModels = [];
  
  void getFavourites() {
    emit(GetFavLoadingState());
    DioHelper().getData(url: GET_FAVOURITES, token: 'Bearer $userToken')
      .then((value) {
        if (value.data is List) {
          favModels = (value.data as List)
            .map((fav) => GetFavourite.fromJson(fav))
            .toList();
          print('Favourites fetched: ${favModels.length}');
          emit(GetFavSuccessState(favModels: favModels));
        } else {
          emit(GetFavErrorState('Invalid response data'));
        }
      })
      .catchError((onError) {
        emit(GetFavErrorState(onError.toString()));
      });
  }
}
