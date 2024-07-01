import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:gluco/core/widgets/network.dart';
import 'package:gluco/features/settings/data/get_favourite/get_favourite.dart';
import 'package:meta/meta.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(GetFavInitial());

  static FavCubit get(context) => BlocProvider.of(context);

  List<GetFavourite> favModels = [];
  Set<String> favoriteID = {};

  void getFavourites() {
    emit(GetFavLoadingState());
    DioHelper()
        .getData(url: GET_FAVOURITES, token: 'Bearer $userToken')
        .then((value) {
      if (value.data is List) {
        favModels = (value.data as List)
            .map((fav) => GetFavourite.fromJson(fav))
            .toList();

        favModels.forEach((item) {
          favoriteID.add(item.doctor!.about.toString());
        });
        print('Favourite Number is ${favModels.length}');
        print('Favourites fetched: ${favModels.length}');
        emit(GetFavSuccessState(favModels: favModels));
      } else {
        emit(GetFavErrorState('Invalid response data'));
      }
    }).catchError((onError) {
      emit(GetFavErrorState(onError.toString()));
    });
  }

  void addFavDoctor({
    required String doctorId,
  }) {
    emit(AddFavLoadingState());
    print('Sending request to add favourite doctor with ID: $doctorId');
    DioHelper()
        .postData(
      url: Add_Favourite,
      data: {
        'doctorId': doctorId,
      },
      token: 'Bearer $userToken',
    )
        .then((value) {
      getFavourites();
      print('Response: ${value.data}');
      emit(AddFavSuccessState());
    }).catchError((onError) {
      print('Error in Addd Fav cubit: ${onError.toString()}');
      emit(AddFavErrorState(onError.toString()));
    });
  }
}
