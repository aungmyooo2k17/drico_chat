import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
class MessageModel with _$MessageModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory MessageModel({
    String? name,
    String? message,
    bool? isSeen,
    String? lastMessageAt,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}
