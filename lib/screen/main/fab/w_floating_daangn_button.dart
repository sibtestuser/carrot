import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/context_extension.dart';
import 'package:fast_app_base/common/widget/animated_width_collapse.dart';
import 'package:fast_app_base/screen/main/fab/riverpod_floating_button.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:fast_app_base/screen/main/tab/tab_item.dart';
import 'package:fast_app_base/screen/write/s_write.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FloatingDaangnButton extends ConsumerWidget {
  const FloatingDaangnButton({super.key});
  static const duration = Duration(milliseconds: 300);
  static const height = 100.0;
  double get layerWidth => App.navigatorKey.currentContext!.locale.languageCode == 'ko' ? 160 : 200;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingButtonState = ref.watch(floatingButtonProvider);
    final isExpanded = floatingButtonState.isExpanded;
    final isSmall = floatingButtonState.isSmall;
    final isHided = floatingButtonState.isHided;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return AnimatedOpacity(
      opacity: isHided ? 0 : 1,
      duration: Duration(milliseconds: 300),
      child: Stack(
        children: [
          IgnorePointer(
            ignoring: !isExpanded,
            child: AnimatedContainer(
              duration: duration,
              color: isExpanded ? Colors.black.withOpacity(0.4) : Colors.transparent,
            ),
          ),
          IgnorePointer(
            ignoring: isHided,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AnimatedOpacity(
                    opacity: isExpanded ? 1 : 0,
                    duration: duration,
                    child: IgnorePointer(
                      ignoring: !isExpanded,
                      child: Column(
                        children: [
                          Container(
                            width: layerWidth,
                            padding: const EdgeInsets.all(15),
                            margin: const EdgeInsets.only(
                              right: 15,
                            ),
                            decoration: BoxDecoration(
                              //  color: context.appColors.floatingActionLayer,
                              color: context.appColors.floatingActionLayer,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Tap(
                                  onTap: () {
                                    context.go('/main/localLife');
                                  },
                                  child: _floatItem('part_time', '$basePath/fab/fab_01.png'),
                                ),
                                _floatItem('lecture', '$basePath/fab/fab_02.png'),
                                _floatItem('agriculture', '$basePath/fab/fab_03.png'),
                                _floatItem('profit', '$basePath/fab/fab_04.png'),
                                _floatItem('car', '$basePath/fab/fab_05.png'),
                              ],
                            ),
                          ),
                          const Height(5),
                          Tap(
                            onTap: () {
                              //context.go();
                              Nav.push(WriteScreen());
                            },
                            child: Container(
                              width: layerWidth,
                              padding: const EdgeInsets.all(15),
                              margin: const EdgeInsets.only(right: 15, bottom: 10),
                              decoration: BoxDecoration(
                                //  color: context.appColors.floatingActionLayer,
                                color: context.appColors.floatingActionLayer,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _floatItem('sell_my_thing', '$basePath/fab/fab_06.png'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MainScreenState.bottomNavigationBarHeight + context.viewPaddingBottom + 10, right: 20),
                    child: Tap(
                      onTap: () {
                        ref.read(floatingButtonProvider.notifier).toggleMenu();
                      },
                      child: AnimatedContainer(
                        duration: duration,
                        height: 60,
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        decoration: BoxDecoration(
                          color: isExpanded ? context.appColors.floatingActionLayer : const Color(0xffff791f),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedRotation(
                              turns: isExpanded ? 0.125 : 0,
                              duration: duration,
                              child: const Icon(Icons.add),
                            ),
                            AnimatedWidthCollapse(
                              visible: !isSmall,
                              duration: duration,
                              child: const Text('write').tr(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _floatItem(String title, String imagePath) {
  return Row(
    children: [
      Image.asset(
        imagePath,
        width: 30,
      ),
      const Width(8),
      Text(title).tr(),
    ],
  );
}
