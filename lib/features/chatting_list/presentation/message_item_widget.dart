import 'package:drico_chat/constants/resources.dart';
import 'package:flutter/material.dart';

import '../../../common_widgets/user_info_widget.dart';

class MessageItem extends StatelessWidget {
  final String name;
  final String message;
  final String lastMessageAt;
  final bool isSeen;

  const MessageItem(
      {Key? key,
      required this.name,
      required this.message,
      required this.lastMessageAt,
      required this.isSeen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: Resources.dimensions.margins.marginMediumLarge),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UserInfo(
            name: name,
            message: message,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lastMessageAt,
                style: Theme.of(context).textTheme.caption,
              ),
              Icon(
                isSeen ? Icons.done_all : Icons.done,
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
