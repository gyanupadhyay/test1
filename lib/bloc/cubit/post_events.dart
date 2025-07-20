// bloc/post_event.dart
import 'package:test1/models/post_model.dart';

abstract class PostEvent {}

class FetchPosts extends PostEvent {}

class CreatePost extends PostEvent {
  final Post post;
  CreatePost(this.post);
}

class UpdatePost extends PostEvent {
  final Post post;
  UpdatePost(this.post);
}

class DeletePost extends PostEvent {
  final int id;
  DeletePost(this.id);
}
