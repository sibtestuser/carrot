import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/fab/riverpod_floating_button.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FcmManager {
  static void requestPermistion() {
    FirebaseMessaging.instance.requestPermission();
  }

  static void initialize(WidgetRef ref) async {
    //foregound
    FirebaseMessaging.onMessage.listen((message) async {
      final title = message.notification?.title;
      debugPrint(message.toString());
      App.navigatorKey.currentContext;
      if (title == null) return;
      ref.read(floatingButtonProvider.notifier).hideButton();
      App.navigatorKey.currentContext?.showSnackbar(title,
          extraButton: Tap(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('열기'),
            ),
            onTap: () {
              App.navigatorKey.currentContext!.go(message.data['deeplink']);
            },
          ));
      //  ScaffoldMessenger.of(App.navigatorKey.currentContext!).showSnackBar(SnackBar(content: Text(title)));
      await Future.delayed(const Duration(milliseconds: 4000));
      ref.read(floatingButtonProvider.notifier).showButton();
    });

    //background

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      App.navigatorKey.currentContext!.go(message.data['deeplink']);
    });

    //not running
    //실행중이 아닐때 퓨처 함수
    final firstMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (firstMessage != null) {
      // await sleepUntil(() => App.navigatorKey.currentContext != null);
      // //  App.navigatorKey.currentContext!.go(firstMessage.data['deeplink']);
      // final context = App.navigatorKey.currentContext;
      // if (context != null && context.mounted) {
      //   context.go(firstMessage.data['deeplink']);
      // }

      await sleepUntil(() => App.navigatorKey.currentContext != null && App.navigatorKey.currentContext!.mounted);
      App.navigatorKey.currentContext!.go(firstMessage.data['deeplink']);
    }

    final token = await FirebaseMessaging.instance.getToken();
    print('토큰 ' + token!);
  }
}
