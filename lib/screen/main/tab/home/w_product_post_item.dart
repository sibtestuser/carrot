import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/widget/w_height_and_width.dart';
import 'package:fast_app_base/entity/dummies.dart';
import 'package:fast_app_base/entity/post/vo_product_post.dart';
import 'package:fast_app_base/entity/post/vo_simple_product_post.dart';
import 'package:fast_app_base/screen/dialog/d_color_bottom.dart';
import 'package:fast_app_base/screen/dialog/d_message.dart';
import 'package:fast_app_base/screen/post_detail/s_post_detail.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nav/enum/enum_nav_ani.dart';
import 'package:timeago/timeago.dart' as timeago;

class ProductPostItem extends StatelessWidget {
  const ProductPostItem({super.key, required this.post});

  final SimpleProductPost post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Tap(
        onTap: () {
          //상세페이지
          context.go('/main/Home/${post.id}', extra: post);

          // Nav.push(
          //   PostDetailScreen(
          //     post.id,
          //     simpleProductPost: post,
          //   ),
          //   durationMs: 800,
          // );
          // MessageDialog(
          //   '안녕하세요',
          //   context: context,
          // ).show(useRootNavigator: false);
          // ColorBottomSheet(
          //   '안녕',
          //   context: context,
          // ).show();
        },
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Hero(
                    tag: '${post.id}_${post.product.images[0]}',
                    child: CachedNetworkImage(
                      width: 130,
                      progressIndicatorBuilder: (context, url, progress) {
                        return const CircularProgressIndicator();
                      },
                      imageUrl: post.product.images[0],
                    ),
                  ),
                ),
                const Width(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: '${post.id}_title',
                        child: Material(
                          child: Text(
                            post.title,
                            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            post.address.simpleAddress + '.',
                            style: TextStyle(fontSize: 14, color: context.appColors.lessImportantColor),
                          ),
                          const Width(10),
                          Text(
                            //timeago.format(post.createTime, locale: context.locale.languageCode),
                            post.createTime.timeago,
                            style: TextStyle(color: context.appColors.lessImportantColor),
                          ),
                        ],
                      ),
                      Text(
                        post.product.price.toWon(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('$basePath/home/post_chat_count.png'),
                    Text(
                      post.chatCount.toString(),
                    ),
                    Image.asset('$basePath/home/post_heart_off.png'),
                    Text(
                      post.likeCount.toString(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
