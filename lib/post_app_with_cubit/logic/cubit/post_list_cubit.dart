import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../posts/data/models/post_model.dart';
import '../../../posts/data/repositories/post_repository.dart';

part 'post_list_state.dart';

class PostListCubit extends Cubit<PostListState> {
  final PostRepository repository = PostRepository();
  PostListCubit() : super(PostListInitial());

  loadPosts() async {
    try {
      emit(PostListLoading());
      var posts = await repository.getPosts();
      emit(PostListSuccess(posts: posts));
    } catch (e) {
      emit(PostListFailure(message: e.toString()));
    }
  }
}
