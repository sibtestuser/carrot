import 'package:fast_app_base/common/dart/extension/ref_extension.dart';
import 'package:fast_app_base/data/network/daangn_api.dart';
import 'package:fast_app_base/entity/post/vo_product_post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productPostProvider = AutoDisposeFutureProviderFamily<ProductPost, int>((ref, id) async {
  ref.cacheFor(Duration(minutes: 10));
  return await DaangnApi.getPost(id);
});
