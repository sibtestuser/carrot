import 'package:fast_app_base/common/widget/w_tap.dart';
import 'package:fast_app_base/screen/notification/f_notification_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final notificationEditModeProvider =
    NotifierProvider<NotificationEditModeNotifier, bool>(NotificationEditModeNotifier.new);

class NotificationEditModeNotifier extends Notifier<bool> {
  @override
  build() {
    // TODO: implement build
    return false;
  }

  void changeMode() {
    state = !state;
    print(state);
  }
}

class NotificationScreen extends HookConsumerWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabcontroller = useTabController(initialLength: 2);
    final isEditMode = ref.watch(notificationEditModeProvider);
    return Material(
      child: Column(
        children: [
          AppBar(
            title: const Text('알림'),
            actions: [
              Tap(
                onTap: () {
                  ref.read(notificationEditModeProvider.notifier).changeMode();
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(isEditMode ? '완료' : '편집'),
                ),
              ),
            ],
          ),
          TabBar(
            controller: tabcontroller,
            labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            labelPadding: const EdgeInsets.symmetric(vertical: 20),
            indicatorColor: Colors.white,
            // indicatorPadding: EdgeInsets.symmetric(horizontal: -100),
            tabs: const [
              Text('활동 알림', style: TextStyle(color: Colors.white)),
              Text('키워드 알림', style: TextStyle(color: Colors.white)),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabcontroller,
              children: [
                NotificationFragment(),
                Container(
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
