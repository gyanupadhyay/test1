import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test1/constants/api_constants.dart';
import 'package:test1/models/post_model.dart';

class PostService {
  final String baseUrl = ApiConstants.baseUrl;

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<Post> createPost(Post post) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(post.toJson()),
    );
    return Post.fromJson(jsonDecode(response.body));
  }

  Future<Post> updatePost(Post post) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${post.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(post.toJson()),
    );
    return Post.fromJson(jsonDecode(response.body));
  }

  Future<void> deletePost(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception("Failed to delete post");
    }
  }
}
