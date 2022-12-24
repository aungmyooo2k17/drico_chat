import 'package:drico_chat/data/model/message_model.dart';
import 'package:drico_chat/data/network/api_service.dart';
import 'package:injectable/injectable.dart';

import '../../../constants/resources.dart';

abstract class ChattingListDataSource {
  Future<List<MessageModel>> list(int userId);
}

@LazySingleton(as: ChattingListDataSource)
class ImplChattingListDataSource implements ChattingListDataSource {
  final ApiClient apiClient;

  const ImplChattingListDataSource(this.apiClient);

  @override
  Future<List<MessageModel>> list(int userId) async {
    try {
      final response = await apiClient.get(
          path: Resources.strings.apis.conversationList,
          params: {"user_id": userId},
          auth: "");

      Future<List<MessageModel>> messages = response;

      return messages;
    } catch (e) {
      throw e.toString();
    }
  }
}
