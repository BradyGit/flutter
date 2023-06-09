import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
/// supabase 로그인 사용자 entity
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String email,
    required String phone,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? emailConfirmedAt,
    DateTime? phoneConfirmedAt,
    DateTime? lastSignInAt,
    String? role,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
