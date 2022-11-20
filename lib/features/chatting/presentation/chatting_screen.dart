import 'package:flutter/material.dart';

import '../../../common_widgets/user_info_widget.dart';
import '../../../common_widgets/conversation_input_widget.dart';
import '../../../features/chatting/presentation/conversation_list_widget.dart';
import '../../../common_widgets/app_icon_button_widget.dart';
import '../../../constants/resources.dart';

class ChattingScreen extends StatefulWidget {
  const ChattingScreen({Key? key}) : super(key: key);

  static String name = "/chatting";

  @override
  State<ChattingScreen> createState() => _ChattingScreenState();
}

class _ChattingScreenState extends State<ChattingScreen> {
  TextEditingController conversationInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resources.colors.scaffold.background,
      appBar: AppBar(
        iconTheme: const IconThemeData(),
        actions: [
          AppIconButton(
            onPressed: () {},
            icon: Icons.video_call_rounded,
          ),
          const SizedBox(
            width: 16.0,
          ),
          AppIconButton(
            onPressed: () {},
            icon: Icons.phone,
          ),
          const SizedBox(
            width: 16.0,
          ),
        ],
        title: UserInfo(
            name: "Aung Myo oo",
            message: "Online",
            imageSize: Resources.dimensions.images.imageSizeLarge),
        backgroundColor: Resources.colors.container.background,
      ),
      body: Stack(
        children: [
          ConversationList(),
          Align(
              alignment: Alignment.bottomCenter,
              child: ConversationInput(
                onClickEmoji: () {},
                onClickGallery: () {},
                onClickMic: () {},
                inputHint: Resources.strings.chatting.conversationInput,
                controller: conversationInputController,
              ))
        ],
      ),
    );
  }

  @override
  void dispose() {
    conversationInputController.dispose();
    super.dispose();
  }
}
