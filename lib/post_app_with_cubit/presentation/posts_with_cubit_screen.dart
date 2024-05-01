import 'package:demo2/post_app_with_cubit/logic/cubit/post_list_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class PostsWithCubitScreen extends StatelessWidget {
  const PostsWithCubitScreen({
    super.key,
    required this.cubit,
  });

  final PostListCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostListCubit, PostListState>(
      bloc: cubit,
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Posts with cubit"),
        ),
        body: BlocBuilder<PostListCubit, PostListState>(
          bloc: cubit,
          builder: (context, state) {
            if (state is PostListLoading) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: ShimmerContainer(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: 250,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    subtitle: Column(
                      children: List.generate(4, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 3,
                          ),
                          child: ShimmerContainer(
                            child: Container(
                              width: double.infinity,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: 8,
              );
            }

            if (state is PostListFailure) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text("Recharger"),
                  ),
                  const SizedBox(height: 10),
                  Text(state.message)
                ],
              );
            }

            if (state is PostListSuccess) {
              var posts = state.posts;

              if (posts.isEmpty) {
                return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Text("No posts yet")],
                );
              }

              return RefreshIndicator(
                onRefresh: () async {
                  cubit.loadPosts();
                },
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    var post = posts[index];
                    return ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.body),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: posts.length,
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: child,
    );
  }
}
