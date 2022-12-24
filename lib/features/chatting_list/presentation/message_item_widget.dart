import 'package:drico_chat/constants/resources.dart';
import 'package:drico_chat/data/model/message_model.dart';
import 'package:flutter/material.dart';

import '../../../common_widgets/user_info_widget.dart';

class MessageItem extends StatelessWidget {
  final MessageModel messageModel;

  const MessageItem({Key? key, required this.messageModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: Resources.dimensions.margins.marginMediumLarge),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UserInfo(
            name: messageModel.name ?? "",
            message: messageModel.message,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                messageModel.lastMessageAt ?? "",
                style: Theme.of(context).textTheme.caption,
              ),
              Icon(
                messageModel.isSeen ?? false ? Icons.done_all : Icons.done,
                color: Colors.blue,
                size: 12,
              )
            ],
          )
        ],
      ),
    );
  }
}
