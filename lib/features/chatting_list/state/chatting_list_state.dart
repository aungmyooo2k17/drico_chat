import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/message_model.dart';

part 'chatting_list_state.freezed.dart';

@freezed
class ChattingListState with _$ChattingListState {
  const factory ChattingListState.initial() = InitialState;
  const factory ChattingListState.loading() = LoadingState;
  const factory ChattingListState.data(List<MessageModel> messages) = DataState;
  const factory ChattingListState.error(String message) = ErrorState;
}
