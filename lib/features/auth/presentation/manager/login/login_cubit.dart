import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:gluco/features/auth/data/auth/auth.dart';
import 'package:gluco/features/auth/presentation/manager/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    AuthModel loginModel;
    emit(LoginLoaded());
    DioHelper().postData(
      url: 'Auth/Login',
      data: {
        'Email': email,
        'Password': password,
      },
    ).then((value) {
      loginModel = AuthModel.fromJson(value.data);
      emit(LoginSuccess(loginModel));
    }).catchError((onError) {
      print('Error in login cubit: ${onError.toString()}');
      emit(LoginFailure(onError.toString()));
    });
  }

  bool isObsecure = true;
  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isObsecure = !isObsecure;
    suffix =
        isObsecure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginchangePasswordVisibility());
  }
}
