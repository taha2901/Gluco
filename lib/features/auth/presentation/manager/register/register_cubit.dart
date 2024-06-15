import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:gluco/core/widgets/network.dart';
import 'package:gluco/features/auth/data/auth.dart';
import 'package:gluco/features/auth/presentation/manager/register/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String username,
    required String email,
    required String password,
    required String confirmpPassword,
    required String phone,
  }) {
    Auth registerModel;
    emit(RegisterLoaded());
    DioHelper().postData(
      url: REGISTER,
      data: {
        'username': username,
        'email': email,
        'phone': phone,
        'password': password,
        'confirmpassword': confirmpPassword,
      },
    ).then((value) {
      registerModel = Auth.fromJson(value.data);
      // debugPrint('All Data in Register cubit is ${registerModel.toString()}');
      emit(RegisterSuccess(registerModel: registerModel));
    }).catchError((onError) {
      // debugPrint('Errr in register cubit is ${onError.toString()}');
      emit(RegisterFailure(onError.toString()));
    });
  }

  bool isObsecure = true;
  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isObsecure = !isObsecure;
    suffix =
        isObsecure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterchangePasswordVisibility());
  }
}
