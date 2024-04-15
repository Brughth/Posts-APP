import 'package:demo2/posts/data/repositories/post_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/post_model.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late PostRepository postRepository;
  late Future<List<PostModel>?> _futurePosts;

  @override
  void initState() {
    postRepository = PostRepository();
    _futurePosts = postRepository.getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: FutureBuilder<List<PostModel>?>(
        future: _futurePosts,
        builder: (
          BuildContext context,
          AsyncSnapshot<List<PostModel>?> snapshot,
        ) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const Center(
                child: CupertinoActivityIndicator(
                  radius: 50,
                ),
              );
            case ConnectionState.none:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.refresh),
                  ),
                  Text(
                    snapshot.error.toString(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.red,
                        ),
                  )
                ],
              );
            case ConnectionState.done:
              var posts = snapshot.data;
              if (posts?.isEmpty ?? true) {
                return const Center(
                  child: Text("Aucun post pour le moment"),
                );
              }
              return ListView.separated(
                itemBuilder: (context, index) {
                  var post = posts[index];
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: posts!.length,
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}
