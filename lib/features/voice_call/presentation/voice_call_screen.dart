import 'package:drico_chat/constants/resources.dart';
import 'package:drico_chat/features/voice_call/presentation/voice_call_detail_screen.dart';
import 'package:drico_chat/features/voice_call/presentation/voice_call_item_widget.dart';
import 'package:flutter/material.dart';

import '../../../common_widgets/app_icon_button_widget.dart';

class VoiceCallScreen extends StatelessWidget {
  const VoiceCallScreen({Key? key}) : super(key: key);

  static String name = "/voice-call";

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
          Resources.strings.app.call,
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
            return VoiceCallItem(
              onCallTap: () {
                Navigator.of(context).pushNamed(VoiceCallDetail.name);
              },
            );
          },
        ),
      ),
    );
  }
}
