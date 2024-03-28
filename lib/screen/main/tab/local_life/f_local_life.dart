import 'package:fast_app_base/screen/main/fab/riverpod_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocalLifeFragment extends ConsumerStatefulWidget {
  const LocalLifeFragment({super.key});

  @override
  ConsumerState<LocalLifeFragment> createState() => _LocalLifeFragmentState();
}

class _LocalLifeFragmentState extends ConsumerState<LocalLifeFragment> {
  final scrollController = ScrollController();

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
    return ListView(
      controller: scrollController,
      children: [
        Image.network('https://picsum.photos/id/403/300/300', fit: BoxFit.fill),
        Container(height: 500, color: Colors.orange),
        Container(height: 500, color: Colors.green),
        Container(height: 500, color: Colors.orange),
        Container(height: 500, color: Colors.blue),
        Container(height: 500, color: Colors.red),
      ],
    );
  }
}
