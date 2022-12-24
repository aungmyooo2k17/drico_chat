import 'package:drico_chat/features/chatting_list/data/chatting_list_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/message_model.dart';

abstract class ChattingListRepo {
  Future<List<MessageModel>> list(int userId);
}

@LazySingleton(as: ChattingListRepo)
class ImplChattingListRepo implements ChattingListRepo {
  final ChattingListDataSource dataSource;

  const ImplChattingListRepo(this.dataSource);

  @override
  Future<List<MessageModel>> list(int userId) {
    try {
      return dataSource.list(userId);
    } catch (e) {
      throw e.toString();
    }
  }
}
