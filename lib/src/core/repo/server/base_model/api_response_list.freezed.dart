// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiResponseList _$ApiResponseListFromJson(Map<String, dynamic> json) {
  return _ApiResponseList.fromJson(json);
}

/// @nodoc
mixin _$ApiResponseList {
  List<dynamic> get data => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: "status_code")
  int get statusCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiResponseListCopyWith<ApiResponseList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseListCopyWith<$Res> {
  factory $ApiResponseListCopyWith(
          ApiResponseList value, $Res Function(ApiResponseList) then) =
      _$ApiResponseListCopyWithImpl<$Res, ApiResponseList>;
  @useResult
  $Res call(
      {List<dynamic> data,
      String status,
      String message,
      @JsonKey(name: "status_code") int statusCode});
}

/// @nodoc
class _$ApiResponseListCopyWithImpl<$Res, $Val extends ApiResponseList>
    implements $ApiResponseListCopyWith<$Res> {
  _$ApiResponseListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? status = null,
    Object? message = null,
    Object? statusCode = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApiResponseListCopyWith<$Res>
    implements $ApiResponseListCopyWith<$Res> {
  factory _$$_ApiResponseListCopyWith(
          _$_ApiResponseList value, $Res Function(_$_ApiResponseList) then) =
      __$$_ApiResponseListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<dynamic> data,
      String status,
      String message,
      @JsonKey(name: "status_code") int statusCode});
}

/// @nodoc
class __$$_ApiResponseListCopyWithImpl<$Res>
    extends _$ApiResponseListCopyWithImpl<$Res, _$_ApiResponseList>
    implements _$$_ApiResponseListCopyWith<$Res> {
  __$$_ApiResponseListCopyWithImpl(
      _$_ApiResponseList _value, $Res Function(_$_ApiResponseList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? status = null,
    Object? message = null,
    Object? statusCode = null,
  }) {
    return _then(_$_ApiResponseList(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiResponseList implements _ApiResponseList {
  const _$_ApiResponseList(final List<dynamic> data,
      {required this.status,
      required this.message,
      @JsonKey(name: "status_code") required this.statusCode})
      : _data = data;

  factory _$_ApiResponseList.fromJson(Map<String, dynamic> json) =>
      _$$_ApiResponseListFromJson(json);

  final List<dynamic> _data;
  @override
  List<dynamic> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final String status;
  @override
  final String message;
  @override
  @JsonKey(name: "status_code")
  final int statusCode;

  @override
  String toString() {
    return 'ApiResponseList(data: $data, status: $status, message: $message, statusCode: $statusCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiResponseList &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_data), status, message, statusCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiResponseListCopyWith<_$_ApiResponseList> get copyWith =>
      __$$_ApiResponseListCopyWithImpl<_$_ApiResponseList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiResponseListToJson(
      this,
    );
  }
}

abstract class _ApiResponseList implements ApiResponseList {
  const factory _ApiResponseList(final List<dynamic> data,
          {required final String status,
          required final String message,
          @JsonKey(name: "status_code") required final int statusCode}) =
      _$_ApiResponseList;

  factory _ApiResponseList.fromJson(Map<String, dynamic> json) =
      _$_ApiResponseList.fromJson;

  @override
  List<dynamic> get data;
  @override
  String get status;
  @override
  String get message;
  @override
  @JsonKey(name: "status_code")
  int get statusCode;
  @override
  @JsonKey(ignore: true)
  _$$_ApiResponseListCopyWith<_$_ApiResponseList> get copyWith =>
      throw _privateConstructorUsedError;
}
