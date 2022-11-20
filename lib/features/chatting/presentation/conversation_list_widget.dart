import 'package:drico_chat/features/chatting/presentation/conversation_item_widget.dart';
import 'package:flutter/material.dart';

class ConversationList extends StatelessWidget {
  final ScrollController listScrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemBuilder: (context, index) => ConversationItem(
        index: index,
      ),
      itemCount: 20,
      reverse: true,
      controller: listScrollController,
    ));
  }
}
