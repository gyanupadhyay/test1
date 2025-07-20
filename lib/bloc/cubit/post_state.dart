
import 'package:test1/models/post_model.dart';

abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<Post> posts;
  PostLoaded(this.posts);
}

class PostSuccess extends PostState {
  final String message;
  PostSuccess(this.message);
}

class PostError extends PostState {
  final String message;
  PostError(this.message);
}