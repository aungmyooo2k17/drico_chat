import 'package:drico_chat/constants/resources.dart';
import 'package:flutter/material.dart';

class ConversationItem extends StatelessWidget {
  final int index;
  const ConversationItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (index % 2 == 0) {
      //This is the sent message. We'll later use data from firebase instead of index to determine the message is sent or received.
      return Container(
          margin: EdgeInsets.only(
              bottom: Resources.dimensions.margins.marginMedium),
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Resources.dimensions.paddings.paddingMedium,
                      horizontal:
                          Resources.dimensions.paddings.paddingMediumLarge),
                  width: 200.0,
                  margin: EdgeInsets.only(
                      right: Resources.dimensions.margins.marginMedium),
                  decoration: BoxDecoration(
                    color: Resources.colors.container.bgConversationItem,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                            Resources.dimensions.conversationItem.radius),
                        bottomRight: Radius.circular(
                            Resources.dimensions.conversationItem.radius),
                        bottomLeft: Radius.circular(
                            Resources.dimensions.conversationItem.radius)),
                  ),
                  child: Text(
                    'This is sents message',
                    style: TextStyle(color: Resources.colors.text.white),
                  ),
                )
              ], // aligns the chatitem to right end
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    top: Resources.dimensions.margins.marginSmall,
                    right: Resources.dimensions.margins.marginMedium),
                child: Text(
                  "12:0m AM",
                  style: TextStyle(
                      color: Resources.colors.text.paragraph,
                      fontSize: Resources.dimensions.fonts.conversationTime,
                      fontStyle: FontStyle.normal),
                ),
              )
            ])
          ]));
    } else {
      // This is a received message
      return Container(
        margin:
            EdgeInsets.only(bottom: Resources.dimensions.margins.marginMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Resources.dimensions.paddings.paddingMedium,
                      horizontal:
                          Resources.dimensions.paddings.paddingMediumLarge),
                  width: 200.0,
                  decoration: BoxDecoration(
                    color: Resources.colors.text.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                            Resources.dimensions.conversationItem.radius),
                        bottomRight: Radius.circular(
                            Resources.dimensions.conversationItem.radius),
                        bottomLeft: Radius.circular(
                            Resources.dimensions.conversationItem.radius)),
                  ),
                  margin: EdgeInsets.only(
                      left: Resources.dimensions.margins.marginMedium),
                  child: Text(
                    'This is a received message',
                    style: TextStyle(color: Resources.colors.text.paragraph),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                left: Resources.dimensions.margins.marginMedium,
                top: Resources.dimensions.margins.marginSmall,
                bottom: Resources.dimensions.margins.marginSmall,
              ),
              child: Text(
                "12:00 AM",
                style: TextStyle(
                    color: Resources.colors.text.paragraph,
                    fontSize: Resources.dimensions.fonts.conversationTime,
                    fontStyle: FontStyle.normal),
              ),
            )
          ],
        ),
      );
    }
  }
}
