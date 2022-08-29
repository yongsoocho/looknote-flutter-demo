// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostModel _$PostModelFromJson(Map<String, dynamic> json) {
  return _PostModel.fromJson(json);
}

/// @nodoc
class _$PostModelTearOff {
  const _$PostModelTearOff();

  _PostModel call(
      {@JsonKey(name: 'post_id') int postId = 0,
      @JsonKey(name: 'updated_at') String updatedAt = '',
      List<String> imageURL = const [],
      int scrap = 0,
      int comment = 0,
      @JsonKey(name: 'is_scrap') bool isScrap = false}) {
    return _PostModel(
      postId: postId,
      updatedAt: updatedAt,
      imageURL: imageURL,
      scrap: scrap,
      comment: comment,
      isScrap: isScrap,
    );
  }

  PostModel fromJson(Map<String, Object?> json) {
    return PostModel.fromJson(json);
  }
}

/// @nodoc
const $PostModel = _$PostModelTearOff();

/// @nodoc
mixin _$PostModel {
  @JsonKey(name: 'post_id')
  int get postId => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  List<String> get imageURL => throw _privateConstructorUsedError;
  int get scrap => throw _privateConstructorUsedError;
  int get comment => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_scrap')
  bool get isScrap => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostModelCopyWith<PostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostModelCopyWith<$Res> {
  factory $PostModelCopyWith(PostModel value, $Res Function(PostModel) then) =
      _$PostModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'post_id') int postId,
      @JsonKey(name: 'updated_at') String updatedAt,
      List<String> imageURL,
      int scrap,
      int comment,
      @JsonKey(name: 'is_scrap') bool isScrap});
}

/// @nodoc
class _$PostModelCopyWithImpl<$Res> implements $PostModelCopyWith<$Res> {
  _$PostModelCopyWithImpl(this._value, this._then);

  final PostModel _value;
  // ignore: unused_field
  final $Res Function(PostModel) _then;

  @override
  $Res call({
    Object? postId = freezed,
    Object? updatedAt = freezed,
    Object? imageURL = freezed,
    Object? scrap = freezed,
    Object? comment = freezed,
    Object? isScrap = freezed,
  }) {
    return _then(_value.copyWith(
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL: imageURL == freezed
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as List<String>,
      scrap: scrap == freezed
          ? _value.scrap
          : scrap // ignore: cast_nullable_to_non_nullable
              as int,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as int,
      isScrap: isScrap == freezed
          ? _value.isScrap
          : isScrap // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$PostModelCopyWith<$Res> implements $PostModelCopyWith<$Res> {
  factory _$PostModelCopyWith(
          _PostModel value, $Res Function(_PostModel) then) =
      __$PostModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'post_id') int postId,
      @JsonKey(name: 'updated_at') String updatedAt,
      List<String> imageURL,
      int scrap,
      int comment,
      @JsonKey(name: 'is_scrap') bool isScrap});
}

/// @nodoc
class __$PostModelCopyWithImpl<$Res> extends _$PostModelCopyWithImpl<$Res>
    implements _$PostModelCopyWith<$Res> {
  __$PostModelCopyWithImpl(_PostModel _value, $Res Function(_PostModel) _then)
      : super(_value, (v) => _then(v as _PostModel));

  @override
  _PostModel get _value => super._value as _PostModel;

  @override
  $Res call({
    Object? postId = freezed,
    Object? updatedAt = freezed,
    Object? imageURL = freezed,
    Object? scrap = freezed,
    Object? comment = freezed,
    Object? isScrap = freezed,
  }) {
    return _then(_PostModel(
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL: imageURL == freezed
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as List<String>,
      scrap: scrap == freezed
          ? _value.scrap
          : scrap // ignore: cast_nullable_to_non_nullable
              as int,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as int,
      isScrap: isScrap == freezed
          ? _value.isScrap
          : isScrap // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostModel implements _PostModel {
  _$_PostModel(
      {@JsonKey(name: 'post_id') this.postId = 0,
      @JsonKey(name: 'updated_at') this.updatedAt = '',
      this.imageURL = const [],
      this.scrap = 0,
      this.comment = 0,
      @JsonKey(name: 'is_scrap') this.isScrap = false});

  factory _$_PostModel.fromJson(Map<String, dynamic> json) =>
      _$$_PostModelFromJson(json);

  @override
  @JsonKey(name: 'post_id')
  final int postId;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @JsonKey()
  @override
  final List<String> imageURL;
  @JsonKey()
  @override
  final int scrap;
  @JsonKey()
  @override
  final int comment;
  @override
  @JsonKey(name: 'is_scrap')
  final bool isScrap;

  @override
  String toString() {
    return 'PostModel(postId: $postId, updatedAt: $updatedAt, imageURL: $imageURL, scrap: $scrap, comment: $comment, isScrap: $isScrap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostModel &&
            const DeepCollectionEquality().equals(other.postId, postId) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.imageURL, imageURL) &&
            const DeepCollectionEquality().equals(other.scrap, scrap) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality().equals(other.isScrap, isScrap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(postId),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(imageURL),
      const DeepCollectionEquality().hash(scrap),
      const DeepCollectionEquality().hash(comment),
      const DeepCollectionEquality().hash(isScrap));

  @JsonKey(ignore: true)
  @override
  _$PostModelCopyWith<_PostModel> get copyWith =>
      __$PostModelCopyWithImpl<_PostModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostModelToJson(this);
  }
}

abstract class _PostModel implements PostModel {
  factory _PostModel(
      {@JsonKey(name: 'post_id') int postId,
      @JsonKey(name: 'updated_at') String updatedAt,
      List<String> imageURL,
      int scrap,
      int comment,
      @JsonKey(name: 'is_scrap') bool isScrap}) = _$_PostModel;

  factory _PostModel.fromJson(Map<String, dynamic> json) =
      _$_PostModel.fromJson;

  @override
  @JsonKey(name: 'post_id')
  int get postId;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  List<String> get imageURL;
  @override
  int get scrap;
  @override
  int get comment;
  @override
  @JsonKey(name: 'is_scrap')
  bool get isScrap;
  @override
  @JsonKey(ignore: true)
  _$PostModelCopyWith<_PostModel> get copyWith =>
      throw _privateConstructorUsedError;
}
