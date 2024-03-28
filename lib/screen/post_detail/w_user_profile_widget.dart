import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/context_extension.dart';
import 'package:fast_app_base/common/widget/w_height_and_width.dart';
import 'package:fast_app_base/entity/user/vo_address.dart';
import 'package:fast_app_base/entity/user/vo_user.dart';
import 'package:flutter/material.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget(this.user, {required this.address, super.key});
  final User user;
  final Address address;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          ClipOval(
            child: CachedNetworkImage(imageUrl: user.profileUrl, width: 60),
          ),
          Width(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.nickname,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Height(10),
                Text(address.simpleAddress),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('${user.temperature}℃', style: const TextStyle(color: Colors.green)),
                      const SizedBox(
                          width: 60,
                          child: LinearProgressIndicator(
                            value: 0.3,
                            color: Colors.green,
                          )),
                    ],
                  ),
                  const Width(5),
                  Image.asset('$basePath/detail/smile.png', width: 30),
                ],
              ),
              Text(
                '매너온도',
                style: TextStyle(
                  color: context.appColors.lessImportantColor,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
