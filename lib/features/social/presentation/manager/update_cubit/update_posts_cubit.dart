import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:gluco/core/widgets/network.dart';
import 'package:meta/meta.dart';

part 'update_posts_state.dart';

class UpdatePostsCubit extends Cubit<UpdatePostsState> {
  UpdatePostsCubit() : super(UpdatePostsInitial());
  static UpdatePostsCubit get(context) => BlocProvider.of(context);

  void updatePost({required String content, required String postId}) {
    emit(UpdatePostsLoaded());
    DioHelper().putData(
      url: 'http://nouraapi.runasp.net/api/Posts/$postId',
      token: 'Bearer $userToken',
      data: {
        'content': content,
      },
    ).then((value) {
      
      emit(UpdatePostsSuccess());
    }).catchError((error) {
      print('object is ${error.toString()}');
      emit(UpdatePostsFailure('Server error: ${error.toString()}'));
    });
  }
}
