import 'package:fast_app_base/entity/post/vo_product_post.dart';
import 'package:fast_app_base/entity/post/vo_simple_product_post.dart';
import 'package:fast_app_base/entity/product/product_status.dart';
import 'package:fast_app_base/entity/product/vo_product.dart';
import 'package:fast_app_base/entity/user/vo_address.dart';
import 'package:fast_app_base/entity/user/vo_user.dart';

String picSum(int id) {
  return 'https://picsum.photos/id/$id/200/200';
}

final user1 = User(
  id: 1,
  nickname: '홍길동',
  temperature: 36.5,
  profileUrl: picSum(1010),
);

final user2 = User(
  id: 1,
  nickname: '김종락',
  temperature: 37.5,
  profileUrl: picSum(900),
);

final user3 = User(
  id: 1,
  nickname: '김파토',
  temperature: 37.5,
  profileUrl: picSum(800),
);

final product1 = Product(user1, '아이폰 13', 7000000, ProductStatus.normal, [picSum(100), picSum(101)]);

final product2 =
    Product(user1, 'TV', 8000000, ProductStatus.normal, [picSum(200), picSum(201), picSum(202), picSum(203)]);

final product3 = Product(user1, '장난감', 500000, ProductStatus.normal, [picSum(300), picSum(301), picSum(302)]);

final post1 = SimpleProductPost(1, product1.user, product1, '글의 내용입니다', Address('서울시 강남구 ', '역삼동'), 30, 20,
    DateTime.now().subtract(Duration(minutes: 30)));

final post2 = SimpleProductPost(2, product2.user, product2, '글의 내용입니다', Address('서울시 관악구', '봉천동'), 10, 15,
    DateTime.now().subtract(Duration(minutes: 40)));

final post3 = SimpleProductPost(3, product3.user, product3, '글의 내용입니다', Address('서울시 봉천동', '신림동'), 10, 15,
    DateTime.now().subtract(Duration(minutes: 50)));

final postList = [post1, post2, post3];
