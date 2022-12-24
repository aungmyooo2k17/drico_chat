import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drico_chat/features/chatting/presentation/chatting_screen.dart';
import 'package:drico_chat/features/chatting_list/provider/chatting_list_provider.dart';
import 'package:drico_chat/features/chatting_list/state/chatting_list_state.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/app_icon_button_widget.dart';
import './message_item_widget.dart';
import './story_list_widget.dart';
import 'package:flutter/material.dart';
import '../../../constants/resources.dart';

class ChattingListScreen extends StatefulWidget {
  const ChattingListScreen({Key? key}) : super(key: key);

  @override
  State<ChattingListScreen> createState() => _ChattingListScreenState();
}

class _ChattingListScreenState extends State<ChattingListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.scheduleFrameCallback((_) {
      context.read<ChattingListProvider>().getList(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resources.colors.scaffold.background,
      appBar: AppBar(
        actions: [
          AppIconButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('/chats/dtI08kOTN9JNeO7SQBOb/messages')
                    .snapshots()
                    .listen((data) {
                  print(data.docs[0]['text']);
                });
              },
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
        child: Selector<ChattingListProvider, ChattingListState>(
          builder: (context, value, child) {
            return value.whenOrNull(
                  loading: () {
                    return Container();
                  },
                  data: (messages) {
                    return Column(
                      children: [
                        const StoryList(),
                        SizedBox(
                          height: Resources.dimensions.margins.marginLarge,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: messages.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(ChattingScreen.name);
                                },
                                child: MessageItem(
                                  messageModel: messages[index],
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    );
                  },
                  error: (message) {
                    return Container();
                  },
                ) ??
                Container();
          },
          selector: (_, provider) => provider.chattingListState,
          child: Container(),
        ),
      ),
    );
  }
}
