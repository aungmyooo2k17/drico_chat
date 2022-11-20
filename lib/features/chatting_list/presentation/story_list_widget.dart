import 'dart:math';

import 'package:drico_chat/features/story/presentation/story_screen.dart';
import 'package:flutter/material.dart';

import '../../../common_widgets/rounded_avatar_widget.dart';
import '../../../constants/resources.dart';

class StoryList extends StatelessWidget {
  const StoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(StoryScreen.name);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              child: RoundedAvatar(
                isStory: true,
                image: Resources.images.profile.profiles[Random().nextInt(7)],
              ),
            ),
          );
        },
      ),
    );
  }
}
