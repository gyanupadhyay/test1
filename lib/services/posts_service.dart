import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test1/constants/api_constants.dart';
import 'package:test1/models/post_model.dart';

class PostsService {
  Future<List<PostModel>> fetchPosts() async {
    final List<PostModel> postModelList = [];

    try {
      final response = await http.get(Uri.parse(ApiConstants.postEndpoint));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        for (var item in data) {
          postModelList.add(PostModel.fromJson(item));
        }
      } else {
        throw ('Failed to load posts: ${response.statusCode}');
      }
    } catch (e) {
      throw ('$e');
    }
    return postModelList;
  }
}
