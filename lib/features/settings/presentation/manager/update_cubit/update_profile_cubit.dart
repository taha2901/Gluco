import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:gluco/core/widgets/network.dart';
import 'package:gluco/features/settings/data/update/update.profile.dart';
import 'package:meta/meta.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());
  static UpdateProfileCubit get(context) => BlocProvider.of(context);

  void updateUserData(
      {required String name,
      required String email,
      required String phone}) {
    emit(UpdateUserLoaded());
    DioHelper().putData(url: UPDATE_PROFILE, token: 'Bearer $userToken', data: {
      'userName': name,
      'email': email,
      'phone': phone,
    }).then((value) async {
      final updateUser = Update.fromJson(value.data);
      print(' update status is ${updateUser.message}');
      print(updateUser.message);
      emit(UpdateUserSuccess());
    }).catchError((onError) {
      emit(UpdateUserFailure('Server error: ${onError.response?.statusCode}'));
    });
  }
}
