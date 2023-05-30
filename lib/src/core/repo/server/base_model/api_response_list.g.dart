// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiResponseList _$$_ApiResponseListFromJson(Map<String, dynamic> json) =>
    _$_ApiResponseList(
      json['data'] as List<dynamic>,
      status: json['status'] as String,
      message: json['message'] as String,
      statusCode: json['status_code'] as int,
    );

Map<String, dynamic> _$$_ApiResponseListToJson(_$_ApiResponseList instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'status_code': instance.statusCode,
    };
