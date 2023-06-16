// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionEntity _$QuestionEntityFromJson(Map<String, dynamic> json) {
  return _QuestionEntity.fromJson(json);
}

/// @nodoc
mixin _$QuestionEntity {
  String get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionEntityCopyWith<QuestionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionEntityCopyWith<$Res> {
  factory $QuestionEntityCopyWith(
          QuestionEntity value, $Res Function(QuestionEntity) then) =
      _$QuestionEntityCopyWithImpl<$Res, QuestionEntity>;
  @useResult
  $Res call({String id, String description, String type, DateTime? createdAt});
}

/// @nodoc
class _$QuestionEntityCopyWithImpl<$Res, $Val extends QuestionEntity>
    implements $QuestionEntityCopyWith<$Res> {
  _$QuestionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? type = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionEntityCopyWith<$Res>
    implements $QuestionEntityCopyWith<$Res> {
  factory _$$_QuestionEntityCopyWith(
          _$_QuestionEntity value, $Res Function(_$_QuestionEntity) then) =
      __$$_QuestionEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String description, String type, DateTime? createdAt});
}

/// @nodoc
class __$$_QuestionEntityCopyWithImpl<$Res>
    extends _$QuestionEntityCopyWithImpl<$Res, _$_QuestionEntity>
    implements _$$_QuestionEntityCopyWith<$Res> {
  __$$_QuestionEntityCopyWithImpl(
      _$_QuestionEntity _value, $Res Function(_$_QuestionEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? type = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$_QuestionEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionEntity implements _QuestionEntity {
  const _$_QuestionEntity(
      {required this.id,
      required this.description,
      required this.type,
      required this.createdAt});

  factory _$_QuestionEntity.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionEntityFromJson(json);

  @override
  final String id;
  @override
  final String description;
  @override
  final String type;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'QuestionEntity(id: $id, description: $description, type: $type, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, description, type, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionEntityCopyWith<_$_QuestionEntity> get copyWith =>
      __$$_QuestionEntityCopyWithImpl<_$_QuestionEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionEntityToJson(
      this,
    );
  }
}

abstract class _QuestionEntity implements QuestionEntity {
  const factory _QuestionEntity(
      {required final String id,
      required final String description,
      required final String type,
      required final DateTime? createdAt}) = _$_QuestionEntity;

  factory _QuestionEntity.fromJson(Map<String, dynamic> json) =
      _$_QuestionEntity.fromJson;

  @override
  String get id;
  @override
  String get description;
  @override
  String get type;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionEntityCopyWith<_$_QuestionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
