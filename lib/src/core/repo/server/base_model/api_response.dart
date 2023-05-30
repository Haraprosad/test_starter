import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@freezed
class ApiResponse with _$ApiResponse {
  const factory ApiResponse({
    required dynamic data,
    required String status,
    required String message,
    @JsonKey(name: "status_code") required int statusCode,
  }) = _ApiResponse;

  factory ApiResponse.fromJson(Map<String, Object?> json) =>
      _$ApiResponseFromJson(json);
}
