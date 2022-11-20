import 'package:flutter/material.dart';

import '../../../common_widgets/app_icon_button_widget.dart';
import '../../../common_widgets/user_info_widget.dart';
import '../../../constants/resources.dart';

class StoryUserItem extends StatelessWidget {
  const StoryUserItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const UserInfo(
          name: "Aung Myo oo",
          message: "Yesterday, 2022",
        ),
        AppIconButton(
          onPressed: () {},
          icon: Icons.more_vert,
          iconColor: Resources.colors.container.background,
        )
      ],
    );
  }
}
