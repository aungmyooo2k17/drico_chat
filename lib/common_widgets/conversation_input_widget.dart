import 'package:flutter/material.dart';

import 'app_icon_button_widget.dart';
import '../constants/resources.dart';

class ConversationInput extends StatefulWidget {
  final TextEditingController controller;
  final Color? bgContainer;
  final Color? bgTextInput;
  final String inputHint;
  final VoidCallback onClickMic;
  final VoidCallback onClickGallery;
  final VoidCallback onClickEmoji;
  const ConversationInput(
      {Key? key,
      required this.onClickEmoji,
      required this.onClickGallery,
      required this.onClickMic,
      required this.inputHint,
      required this.controller,
      this.bgContainer,
      this.bgTextInput})
      : super(key: key);

  @override
  State<ConversationInput> createState() => _ConversationInputState();
}

class _ConversationInputState extends State<ConversationInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Resources.dimensions.container.bottomBarHeight,
        width: MediaQuery.of(context).size.width,
        color: widget.bgContainer ?? Resources.colors.container.background,
        child: Container(
          margin: EdgeInsets.symmetric(
              vertical: Resources.dimensions.margins.marginMedium,
              horizontal: Resources.dimensions.margins.marginMediumLarge),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(
                  Resources.dimensions.container.bottomBarHeight)),
              color: widget.bgTextInput ??
                  Resources.colors.container.textFormField),
          child: Row(
            children: [
              SizedBox(
                width: Resources.dimensions.margins.marginMedium,
              ),
              AppIconButton(onPressed: widget.onClickMic, icon: Icons.mic),
              SizedBox(
                width: Resources.dimensions.margins.marginMedium,
              ),
              Flexible(
                  child: TextFormField(
                controller: widget.controller,
                maxLines: 5,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                        vertical:
                            Resources.dimensions.paddings.paddingMediumLarge,
                        horizontal: Resources.dimensions.paddings.paddingSmall),
                    hintText: widget.inputHint),
              )),
              AppIconButton(
                  onPressed: widget.onClickGallery, icon: Icons.image),
              AppIconButton(onPressed: widget.onClickEmoji, icon: Icons.mood),
            ],
          ),
        ));
  }
}
