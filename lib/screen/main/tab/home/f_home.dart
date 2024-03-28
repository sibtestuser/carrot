import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/entity/dummies.dart';
import 'package:fast_app_base/screen/main/fab/riverpod_floating_button.dart';
import 'package:fast_app_base/screen/main/fab/w_floating_daangn_button.dart';
import 'package:fast_app_base/screen/main/tab/home/provider/post_provider.dart';
import 'package:fast_app_base/screen/main/tab/home/w_product_post_item.dart';
import 'package:fast_app_base/screen/notification/s_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeFragment extends ConsumerStatefulWidget {
  const HomeFragment({super.key});

  @override
  ConsumerState<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends ConsumerState<HomeFragment> {
  final scrollController = ScrollController();
  String title = '플러터동';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      final floatingState = ref.read(floatingButtonProvider);

      if (scrollController.position.pixels > 100 && !floatingState.isSmall) {
        ref.read(floatingButtonProvider.notifier).onScrollDown();
      } else if (scrollController.position.pixels < 100 && floatingState.isSmall) {
        ref.read(floatingButtonProvider.notifier).onScrollUp();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final postList = ref.watch(postProvider);
    return Column(
      children: [
        AppBar(
          automaticallyImplyLeading: false,
          title: PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                title = value;
              });
            },
            itemBuilder: (context) {
              return ['다트동', '앱동']
                  .map((e) => PopupMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList();
            },
            child: Text(title),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Nav.push(NotificationScreen());
              },
              icon: Icon(Icons.notifications_none_rounded),
            ),
          ],
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.only(bottom: FloatingDaangnButton.height),
            itemBuilder: (context, index) {
              return ProductPostItem(post: postList[index]);
            },
            separatorBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Line(),
              );
            },
            controller: scrollController,
            itemCount: postList.length,
          ),
        ),
      ],
    );
  }
}
