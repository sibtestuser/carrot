import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/data/network/result/api_error.dart';
import 'package:fast_app_base/data/simple_result.dart';
import 'package:fast_app_base/entity/dummies.dart';
import 'package:fast_app_base/entity/post/vo_product_post.dart';
import 'package:fast_app_base/screen/notification/vo/dummies.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';

class DaangnApi {
  static Future<SimpleResult<List<DaangnNotification>, ApiError>> getNotification() async {
    await sleepAsync(const Duration(seconds: 2));
    return SimpleResult.success(notificationList);
  }

  static Future<ProductPost> getPost(int id) async {
    await sleepAsync(const Duration(seconds: 1));

    return ProductPost(simpleProductPost: post1, contents: '깨끗하게 잘 썼어요' '잘쓰면 좋겠어요');
  }
}
