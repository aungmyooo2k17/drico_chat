import 'package:drico_chat/features/chatting/presentation/chatting_screen.dart';

import '../../../common_widgets/app_icon_button_widget.dart';
import './message_item_widget.dart';
import './story_list_widget.dart';
import 'package:flutter/material.dart';
import '../../../constants/resources.dart';

class ChattingListScreen extends StatelessWidget {
  const ChattingListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resources.colors.scaffold.background,
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
          Resources.strings.app.appName,
          style: Theme.of(context).textTheme.headline6,
        ),
        backgroundColor: Resources.colors.scaffold.background,
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: Resources.dimensions.paddings.paddingMediumLarge,
            left: Resources.dimensions.paddings.paddingMediumLarge,
            right: Resources.dimensions.paddings.paddingMediumLarge),
        child: Column(
          children: [
            const StoryList(),
            SizedBox(
              height: Resources.dimensions.margins.marginLarge,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(ChattingScreen.name);
                    },
                    child: const MessageItem(
                      name: "Aung Myo Oo",
                      message: "How are you?",
                      isSeen: true,
                      lastMessageAt: "12:23 PM",
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
