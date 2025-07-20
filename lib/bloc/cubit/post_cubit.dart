import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/bloc/cubit/post_state.dart';
import 'package:test1/models/post_model.dart';
import 'package:test1/services/posts_service.dart';

class PostCubit extends Cubit<PostState> {
  final PostsService postsService;
  PostCubit(this.postsService) : super(PostInitial());

  void getPosts() async {
    emit(PostLoading());
    try {
      List<PostModel> postModelList = await postsService.fetchPosts();
      emit(PostSuccess(postModelList));
    } catch (e) {
      emit(PostError('Error: $e'));
    }
  }
}
