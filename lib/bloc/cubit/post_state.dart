import 'package:equatable/equatable.dart';
import 'package:test1/models/post_model.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {}

final class PostLoading extends PostState {}

final class PostSuccess extends PostState {
  final List<PostModel> postModelList;
  const PostSuccess(this.postModelList);

  @override
  List<Object> get props => [postModelList];
}

final class PostError extends PostState {
  final String error;
  const PostError(this.error);
  @override
  List<Object> get props => [error];
}
