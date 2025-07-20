import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/bloc/cubit/post_events.dart';
import 'package:test1/services/posts_service.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostService postService;

  PostBloc(this.postService) : super(PostInitial()) {
    on<FetchPosts>((event, emit) async {
      emit(PostLoading());
      try {
        final posts = await postService.fetchPosts();
        emit(PostLoaded(posts));
      } catch (e) {
        emit(PostError(e.toString()));
      }
    });

    on<CreatePost>((event, emit) async {
      emit(PostLoading());
      try {
        final post = await postService.createPost(event.post);
        emit(PostSuccess("Post created with ID: ${post.id}"));
        add(FetchPosts());
      } catch (e) {
        emit(PostError(e.toString()));
      }
    });

    on<UpdatePost>((event, emit) async {
      emit(PostLoading());
      try {
        final post = await postService.updatePost(event.post);
        emit(PostSuccess("Post updated with ID: ${post.id}"));
        add(FetchPosts());
      } catch (e) {
        emit(PostError(e.toString()));
      }
    });

    on<DeletePost>((event, emit) async {
      emit(PostLoading());
      try {
        await postService.deletePost(event.id);
        emit(PostSuccess("Post deleted successfully"));
        add(FetchPosts());
      } catch (e) {
        emit(PostError(e.toString()));
      }
    });
  }
}
