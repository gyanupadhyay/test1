import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/bloc/cubit/post_state.dart';
import 'package:test1/models/post_model.dart';
import 'package:test1/services/posts_service.dart';

class PostCubit extends Cubit<PostState> {
  final PostsService postsService;
  final int _limit = 10;

  int _page = 1;
  bool _hasMore = true;
  List<PostModel> _posts = [];

  PostCubit(this.postsService) : super(PostInitial());

  Future<void> fetchInitialPosts() async {
    emit(PostLoading());
    _page = 1;
    _hasMore = true;
    _posts = [];

    try {
      final newPosts = await postsService.fetchPostsPagination(
        page: _page,
        limit: _limit,
      );
      _posts.addAll(newPosts);
      _hasMore = newPosts.length == _limit;
      emit(PostLoaded(List.from(_posts), hasMore: _hasMore));
      _page++;
    } catch (e) {
      emit(PostError('Error: $e'));
    }
  }

  Future<void> fetchMorePosts() async {
    if (!_hasMore || state is PostPaginating || state is PostLoading) return;

    emit(PostPaginating(List.from(_posts), hasMore: _hasMore));

    try {
      final newPosts = await postsService.fetchPostsPagination(
        page: _page,
        limit: _limit,
      );
      _posts.addAll(newPosts);
      _hasMore = newPosts.length == _limit;
      emit(PostLoaded(List.from(_posts), hasMore: _hasMore));
      _page++;
    } catch (e) {
      emit(PostError('Error: $e'));
    }
  }
}
