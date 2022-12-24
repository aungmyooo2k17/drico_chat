import 'package:drico_chat/data/model/message_model.dart';
import 'package:drico_chat/features/chatting_list/data/chatting_list_repo.dart';
import 'package:drico_chat/features/chatting_list/state/chatting_list_state.dart';
import 'package:flutter/material.dart';

class ChattingListProvider extends ChangeNotifier {
  final ChattingListRepo repo;
  static List<MessageModel> messages = [];

  ChattingListState chattingListState = const ChattingListState.initial();

  ChattingListProvider({required this.repo});

  void getList(int userId) async {
    try {
      chattingListState = const ChattingListState.loading();
      notifyListeners();
      messages = await repo.list(userId);
      print(messages);
    } catch (e) {
      chattingListState = ChattingListState.error(e.toString());
    }
    notifyListeners();
  }

  List<MessageModel> get getMessage {
    return messages;
  }
}
