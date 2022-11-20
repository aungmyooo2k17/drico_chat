import 'package:flutter/material.dart';

import '../../../common_widgets/app_icon_button_widget.dart';
import '../../../common_widgets/user_info_widget.dart';
import '../../../constants/resources.dart';

class VoiceCallItem extends StatelessWidget {
  final VoidCallback onCallTap;
  const VoiceCallItem({Key? key, required this.onCallTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: Resources.dimensions.margins.marginMediumLarge),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const UserInfo(
            name: "Aung Myo oo",
            message: "📞 Missed - Yesterday, 2022",
          ),
          AppIconButton(
            onPressed: onCallTap,
            icon: Icons.phone,
            iconColor: Resources.colors.button.grey,
            bgColor: Resources.colors.button.white,
          )
        ],
      ),
    );
  }
}
