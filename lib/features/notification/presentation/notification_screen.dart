import 'package:drico_chat/features/notification/presentation/notification_item_widget.dart';
import 'package:flutter/material.dart';

import '../../../common_widgets/app_icon_button_widget.dart';
import '../../../constants/resources.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  static String name = "/notifications";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          AppIconButton(
              onPressed: () {},
              icon: Icons.search,
              bgColor: Resources.colors.button.white),
          const SizedBox(
            width: 16.0,
          ),
          AppIconButton(
              onPressed: () {},
              icon: Icons.edit,
              bgColor: Resources.colors.button.white),
          const SizedBox(
            width: 16.0,
          ),
        ],
        title: Text(
          Resources.strings.app.notification,
          style: Theme.of(context).textTheme.headline6,
        ),
        backgroundColor: Resources.colors.scaffold.background,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Resources.dimensions.paddings.paddingMediumLarge,
          vertical: Resources.dimensions.paddings.paddingMedium,
        ),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return const NotificationItem();
          },
        ),
      ),
    );
  }
}
