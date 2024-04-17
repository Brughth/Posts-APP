import 'package:demo2/posts/data/repositories/post_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/comment_model.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({
    super.key,
    required this.postId,
  });
  final int postId;

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  late PostRepository repository;
  late Future<List<CommentModel>> _futureComments;

  @override
  void initState() {
    repository = PostRepository();

    _futureComments = repository.getPostComments(
      postId: widget.postId,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comments"),
      ),
      body: FutureBuilder<List<CommentModel>>(
        future: _futureComments,
        builder: (
          BuildContext context,
          AsyncSnapshot<List<CommentModel>> snapshot,
        ) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.waiting:
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
              var comments = snapshot.data;
              if (comments?.isEmpty ?? true) {
                return const Center(
                  child: Text("Aucun commentaire pour le moment"),
                );
              }
              return ListView.separated(
                itemCount: comments!.length,
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemBuilder: (context, index) {
                  var comment = comments[index];
                  return ListTile(
                    title: Text(comment.email),
                    subtitle: Text(comment.body),
                  );
                },
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}
