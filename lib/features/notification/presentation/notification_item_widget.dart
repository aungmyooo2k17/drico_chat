import 'package:flutter/material.dart';

import '../../../common_widgets/app_icon_button_widget.dart';
import '../../../common_widgets/user_info_widget.dart';
import '../../../constants/resources.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: Resources.dimensions.margins.marginMediumLarge),
      child: const UserInfo(
        name: "Aung Myo oo",
        message: "Added a story at Yesterday, 2022",
      ),
    );
  }
}
