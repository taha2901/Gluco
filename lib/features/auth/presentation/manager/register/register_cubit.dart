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
    emit(RegisterLoaded());
    DioHelper().postData(
      url: REGISTER,
      data: {
        'Username': username,
        'Email': email,
        'Phone': phone,
        'Password': password,
        'confirmpassword': confirmpPassword,
      },
    ).then((value) {
      final  registerModel = Auth.fromJson(value.data);
      emit(RegisterSuccess(registerModel: registerModel));
    }).catchError((onError) {
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
