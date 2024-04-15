import 'package:demo2/posts/data/models/post_model.dart';
import 'package:dio/dio.dart';

class PostRepository {
  final Dio dio = Dio();

  Future<List<PostModel>?> getPosts() async {
    try {
      var response = await dio.get(
        'https://jsonplaceholder.typicode.com/posts',
      );

      List<PostModel> posts = [];

      for (var post in response.data) {
        posts.add(PostModel.fromJson(post));
      }

      return posts;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
