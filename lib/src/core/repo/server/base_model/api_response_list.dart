import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response_list.freezed.dart';
part 'api_response_list.g.dart';

@freezed
class ApiResponseList with _$ApiResponseList {
  const factory ApiResponseList(
    List<dynamic> data, {
    required String status,
    required String message,
    @JsonKey(name: "status_code") required int statusCode,
  }) = _ApiResponseList;

  factory ApiResponseList.fromJson(Map<String, Object?> json) =>
      _$ApiResponseListFromJson(json);
}
