import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:gluco/core/widgets/network.dart';
import 'package:gluco/features/social/data/add_post_model.dart';
import 'package:meta/meta.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit() : super(AddPostInitial());
  static AddPostCubit get(context) => BlocProvider.of(context);
  void addPost({
    required String content,
  }) {
    emit(PostSocialLoaded());
    DioHelper()
        .postData(
            url: GET_POSTS,
            data: {
              'content': content,
            },
            token: 'Bearer $userToken')
        .then((value) {
      final addPostModel = AddPostModel.fromJson(value.data);
      emit(PostSocialSuccess(addPostModel));

    }).catchError((onError) {
      print('Error in login cubit: ${onError.toString()}');
      emit(PostSocialError());
    });
  }
}