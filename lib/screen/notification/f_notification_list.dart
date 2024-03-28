import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/provider/notification_provider.dart';
import 'package:fast_app_base/screen/notification/vo/dummies.dart';
import 'package:fast_app_base/screen/notification/w_notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationFragment extends HookConsumerWidget {
  const NotificationFragment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(notificationListProvider);
    return list == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return NotificationItemWidget(notification: list[index], onTap: () {});
            },
          );
  }
}
