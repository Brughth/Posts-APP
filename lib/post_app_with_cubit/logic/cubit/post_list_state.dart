part of 'post_list_cubit.dart';

@immutable
sealed class PostListState {}

final class PostListInitial extends PostListState {}

final class PostListLoading extends PostListState {}

final class PostListFailure extends PostListState {
  final String message;
  PostListFailure({required this.message});
}

final class PostListSuccess extends PostListState {
  final List<PostModel> posts;
  PostListSuccess({required this.posts});
}
