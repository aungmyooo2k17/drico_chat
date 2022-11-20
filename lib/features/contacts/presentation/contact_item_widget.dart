import 'package:flutter/material.dart';

import '../../../common_widgets/app_icon_button_widget.dart';
import '../../../common_widgets/user_info_widget.dart';
import '../../../constants/resources.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: Resources.dimensions.margins.marginMediumLarge),
      child: const UserInfo(
        name: "Aung Myo oo",
        message: "DricoChat",
      ),
    );
  }
}
