import 'package:demo2/posts/data/models/comment_model.dart';
import 'package:demo2/posts/data/models/post_model.dart';
import 'package:dio/dio.dart';

class PostRepository {
  final Dio dio = Dio();

  Future<List<PostModel>> getPosts() async {
    var response = await dio.get(
      'https://jsonplaceholder.typicode.com/posts',
    );

    List<PostModel> posts = [];

    for (var post in response.data) {
      posts.add(PostModel.fromJson(post));
    }

    return posts;
  }

  Future<List<CommentModel>> getPostComments({required int postId}) async {
    Response response = await dio.get(
      'https://jsonplaceholder.typicode.com/posts/$postId/comments',
    );

    var comments = <CommentModel>[];

    for (var jsonComment in response.data) {
      comments.add(CommentModel.fromJson(jsonComment));
    }

    return comments;
  }
}
