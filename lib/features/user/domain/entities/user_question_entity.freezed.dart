// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_question_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserQuestionEntity _$UserQuestionEntityFromJson(Map<String, dynamic> json) {
  return _UserQuestionEntity.fromJson(json);
}

/// @nodoc
mixin _$UserQuestionEntity {
  String get currentQuestionId => throw _privateConstructorUsedError;
  String get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserQuestionEntityCopyWith<UserQuestionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserQuestionEntityCopyWith<$Res> {
  factory $UserQuestionEntityCopyWith(
          UserQuestionEntity value, $Res Function(UserQuestionEntity) then) =
      _$UserQuestionEntityCopyWithImpl<$Res, UserQuestionEntity>;
  @useResult
  $Res call({String currentQuestionId, String result});
}

/// @nodoc
class _$UserQuestionEntityCopyWithImpl<$Res, $Val extends UserQuestionEntity>
    implements $UserQuestionEntityCopyWith<$Res> {
  _$UserQuestionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentQuestionId = null,
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      currentQuestionId: null == currentQuestionId
          ? _value.currentQuestionId
          : currentQuestionId // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserQuestionEntityCopyWith<$Res>
    implements $UserQuestionEntityCopyWith<$Res> {
  factory _$$_UserQuestionEntityCopyWith(_$_UserQuestionEntity value,
          $Res Function(_$_UserQuestionEntity) then) =
      __$$_UserQuestionEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String currentQuestionId, String result});
}

/// @nodoc
class __$$_UserQuestionEntityCopyWithImpl<$Res>
    extends _$UserQuestionEntityCopyWithImpl<$Res, _$_UserQuestionEntity>
    implements _$$_UserQuestionEntityCopyWith<$Res> {
  __$$_UserQuestionEntityCopyWithImpl(
      _$_UserQuestionEntity _value, $Res Function(_$_UserQuestionEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentQuestionId = null,
    Object? result = null,
  }) {
    return _then(_$_UserQuestionEntity(
      currentQuestionId: null == currentQuestionId
          ? _value.currentQuestionId
          : currentQuestionId // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserQuestionEntity implements _UserQuestionEntity {
  const _$_UserQuestionEntity(
      {required this.currentQuestionId, required this.result});

  factory _$_UserQuestionEntity.fromJson(Map<String, dynamic> json) =>
      _$$_UserQuestionEntityFromJson(json);

  @override
  final String currentQuestionId;
  @override
  final String result;

  @override
  String toString() {
    return 'UserQuestionEntity(currentQuestionId: $currentQuestionId, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserQuestionEntity &&
            (identical(other.currentQuestionId, currentQuestionId) ||
                other.currentQuestionId == currentQuestionId) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, currentQuestionId, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserQuestionEntityCopyWith<_$_UserQuestionEntity> get copyWith =>
      __$$_UserQuestionEntityCopyWithImpl<_$_UserQuestionEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserQuestionEntityToJson(
      this,
    );
  }
}

abstract class _UserQuestionEntity implements UserQuestionEntity {
  const factory _UserQuestionEntity(
      {required final String currentQuestionId,
      required final String result}) = _$_UserQuestionEntity;

  factory _UserQuestionEntity.fromJson(Map<String, dynamic> json) =
      _$_UserQuestionEntity.fromJson;

  @override
  String get currentQuestionId;
  @override
  String get result;
  @override
  @JsonKey(ignore: true)
  _$$_UserQuestionEntityCopyWith<_$_UserQuestionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
