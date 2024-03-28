import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/context_extension.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/common/widget/w_vertical_line.dart';
import 'package:fast_app_base/entity/post/vo_product_post.dart';
import 'package:fast_app_base/entity/post/vo_simple_product_post.dart';
import 'package:fast_app_base/entity/product/vo_product.dart';
import 'package:fast_app_base/screen/post_detail/provider/product_post_provider.dart';
import 'package:fast_app_base/screen/post_detail/w_post_content.dart';
import 'package:fast_app_base/screen/post_detail/w_user_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PostDetailScreen extends ConsumerWidget {
  const PostDetailScreen(this.id, {super.key, this.simpleProductPost});
  final SimpleProductPost? simpleProductPost;
  final int id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productPost = ref.watch(productPostProvider(id));

    return productPost.when(
      data: (data) {
        return _PostDetail(
          simpleProductPost ?? data.simpleProductPost,
          productPost: data,
        );
      },
      error: (error, trace) {
        return Text('에러발생');
      },
      loading: () =>
          simpleProductPost != null ? _PostDetail(simpleProductPost!) : Center(child: CircularProgressIndicator()),
    );
  }
}

class _PostDetail extends HookWidget {
  const _PostDetail(this.simpleProductPost, {super.key, this.productPost});

  final SimpleProductPost simpleProductPost;
  final ProductPost? productPost;
  static const bottomMenuHeight = 100.0;
  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    return Material(
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: bottomMenuHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ImagePager(pageController: pageController, simpleProductPost: simpleProductPost),
                UserProfileWidget(
                  simpleProductPost.product.user,
                  address: simpleProductPost.address,
                ),
                Tap(
                    onTap: () {
                      Nav.push(PostDetailScreen(simpleProductPost.id, simpleProductPost: simpleProductPost),
                          durationMs: 800, context: context);
                    },
                    child: PostContent(
                      simpleProductPost: simpleProductPost,
                      productPost: productPost,
                    )),
              ],
            ),
          ),

          const _AppBar(), //앱바
          Align(
            alignment: Alignment.bottomCenter,
            child: PostDetailBottomMenu(productPost: simpleProductPost),
          ), //바텀뷰
        ],
      ),
    );
  }
}

class PostDetailBottomMenu extends StatelessWidget {
  PostDetailBottomMenu({super.key, required this.productPost});

  late final Product product = productPost.product;
  final SimpleProductPost productPost;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: _PostDetail.bottomMenuHeight,
      //color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Line(),
          Expanded(
            child: Row(
              children: [
                LikeButton(
                  isLiked: false,
                ),
                const Width(10),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
                  child: VerticalLine(),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [Text(product.price.toWon())],
                      ),
                      Text(
                        '가격 제안하기',
                        style: TextStyle(color: Colors.orange),
                      )
                    ],
                  ),
                ),
                RoundButton(
                  text: '채팅하기',
                  onTap: () {},
                  bgColor: Colors.orange,
                  borderRadius: 7,
                ),
                Width(10)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LikeButton extends StatefulWidget {
  LikeButton({super.key, required this.isLiked});
  bool isLiked;
  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    //   final Animation curve = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _animation = ColorTween(
      begin: Colors.grey,
      end: Colors.red, // 시작 색상 및 끝 색상 설정
    ).animate(_controller);
    _animation.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleLike() {
    if (widget.isLiked == false) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    widget.isLiked = !widget.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          _toggleLike();
        });
        //  _controller.forward();
      },
      icon: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Icon(
            Icons.favorite,
            color: _animation.value,
          );
        },
      ),
    );
  }
}

class _ImagePager extends StatelessWidget {
  const _ImagePager({
    super.key,
    required this.pageController,
    required this.simpleProductPost,
  });

  final PageController pageController;
  final SimpleProductPost simpleProductPost;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.deviceWidth,
      child: Stack(
        children: [
          PageView(
            controller: pageController,
            children: simpleProductPost.product.images
                .map((url) => Hero(
                      tag: '${simpleProductPost.id}_$url',
                      child: CachedNetworkImage(
                        imageUrl: url,
                        fit: BoxFit.fill,
                      ),
                    ))
                .toList(),
          ),
          if (simpleProductPost.product.images.length > 1)
            Align(
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
                  controller: pageController, // PageController
                  count: simpleProductPost.product.images.length,
                  effect: const JumpingDotEffect(
                      verticalOffset: 10,
                      dotColor: Colors.white54,
                      activeDotColor: Colors.black54), // your preferred effect
                  onDotClicked: (index) {
                    pageController.animateToPage(
                      index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.bounceInOut,
                    );
                  }),
            ),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.statusBarHeight + 60,
      child: AppBar(
        backgroundColor: Colors.transparent,
        // toolbarHeight: context.statusBarHeight,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.white,
          onPressed: () {
            Nav.pop(context);
            // Nav.clearAll(context: context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
