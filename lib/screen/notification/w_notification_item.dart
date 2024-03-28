import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_height_and_width.dart';
import 'package:fast_app_base/common/widget/w_tap.dart';
import 'package:fast_app_base/screen/notification/provider/notification_provider.dart';
import 'package:fast_app_base/screen/notification/s_notification.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationItemWidget extends ConsumerStatefulWidget {
  const  NotificationItemWidget({super.key, required this.notification, required this.onTap});
  final DaangnNotification notification;
  final void Function() onTap;

  @override
  ConsumerState<NotificationItemWidget> createState() => _NotificationItemWidgetState();
}

class _NotificationItemWidgetState extends ConsumerState<NotificationItemWidget> {
  static const leftPadding = 15.0;
  static const iconWidth = 25.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isEditMode = ref.watch(notificationEditModeProvider);
    return Tap(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: widget.notification.isRead ? context.backgroundColor : context.appColors.unreadColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Width(leftPadding),
                Image.asset(widget.notification.type.iconPath, width: iconWidth),
                const Width(10),
                Expanded(child: Text(widget.notification.title, style: TextStyle(fontWeight: FontWeight.bold))),
                if (isEditMode)
                  IconButton(
                    onPressed: () {
                      final list = ref.read(notificationListProvider);
                      if (list != null) {
                        list.remove(widget.notification);

                        ref.read(notificationListProvider.notifier).updateList(List.from(list));
                      }
                    },
                    icon: const Icon(Icons.delete),
                  ),
                // }

                const Width(10),
              ],
            ),
            Height(5),
            Padding(
              padding: const EdgeInsets.only(left: leftPadding + iconWidth),
              child: Text(
                widget.notification.description,
                style: TextStyle(color: context.appColors.lessImportantColor),
              ),
            ),
            Height(10),
            Padding(
              padding: EdgeInsets.only(left: leftPadding + iconWidth),
              child: Text(
                timeago.format(widget.notification.time, locale: context.locale.languageCode),
                style: TextStyle(fontSize: 13, color: context.appColors.lessImportantColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
