import 'package:test1/models/post_model.dart';

abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {} // First load only

class PostLoaded extends PostState {
  final List<PostModel> posts;
  final bool hasMore;

  PostLoaded(this.posts, {this.hasMore = true});
}

class PostPaginating extends PostLoaded {
  PostPaginating(super.posts, {super.hasMore});
}

class PostError extends PostState {
  final String message;
  PostError(this.message);
}
