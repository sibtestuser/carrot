import 'package:fast_app_base/screen/notification/vo/notification_type.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';

final notification1 = DaangnNotification(
  NotificationType.official,
  '💌 8월 가계부가 도착했어요',
  '#당근, #당근가계부 #자원재순환 #따뜻한 거래',
  DateTime.now().subtract(const Duration(minutes: 30)),
);

final notification2 = DaangnNotification(
  NotificationType.legal,
  '당근페이 전자금융거래 이용약관 개정 안내',
  '개정사항을 확인해 주세요',
  DateTime.now().subtract(const Duration(days: 1)),
);

final notification3 = DaangnNotification(
  NotificationType.official,
  '지금 새로워진 \'당근\'을 만나보세요 🥕',
  '새 이름 사용',
  DateTime.now().subtract(const Duration(days: 3)),
);

final notification4 = DaangnNotification(
  NotificationType.official,
  '가족 집수리',
  '마음에 드셨다면 다른 이웃들을 위해 따듯한 한마디',
  DateTime.now().subtract(const Duration(days: 7)),
);

final notificationList = [notification1, notification2, notification3, notification4];
