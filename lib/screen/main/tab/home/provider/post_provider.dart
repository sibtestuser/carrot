import 'package:fast_app_base/entity/dummies.dart';
import 'package:fast_app_base/entity/post/vo_simple_product_post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postProvider = NotifierProvider<PostNotifier, List<SimpleProductPost>>(PostNotifier.new);

class PostNotifier extends Notifier<List<SimpleProductPost>> {
  @override
  build() {
    return postList;
  }

  void upDate(SimpleProductPost post) {
    state = List.of(state)..add(post);
  }
}
