import 'package:fast_app_base/common/common.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:fast_app_base/entity/post/vo_product_post.dart';
import 'package:fast_app_base/entity/post/vo_simple_product_post.dart';
import 'package:flutter/material.dart';

class PostContent extends StatelessWidget {
  const PostContent({super.key, required this.simpleProductPost, this.productPost});
  final SimpleProductPost simpleProductPost;
  final ProductPost? productPost;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: '${simpleProductPost.id}_title',
            child: Material(
              child: Text(
                simpleProductPost.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Height(20),
          Text(
            timeago.format(simpleProductPost.createTime, locale: context.locale.languageCode),
            style: TextStyle(color: context.appColors.lessImportantColor),
          ),
          // Text(productPost.contents),
          if (productPost == null)
            Center(
              child: CircularProgressIndicator(),
            ),
          if (productPost != null)
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 60),
              child: Text(productPost!.contents),
            ),
        ],
      ),
    );
  }
}
