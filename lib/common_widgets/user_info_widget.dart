import 'dart:math';

import 'package:flutter/material.dart';

import '../constants/resources.dart';
import 'rounded_avatar_widget.dart';

class UserInfo extends StatelessWidget {
  final String name;
  final String? message;
  final double? imageSize;
  const UserInfo({Key? key, required this.name, this.message, this.imageSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundedAvatar(
          imageSize: imageSize,
          isStory: false,
          image: Resources.images.profile.profiles[Random().nextInt(7)],
        ),
        const SizedBox(
          width: 16.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Text(
              message ?? "",
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ],
    );
  }
}
