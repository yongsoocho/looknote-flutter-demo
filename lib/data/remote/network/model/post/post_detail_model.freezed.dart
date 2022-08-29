// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostDetailModel _$PostDetailModelFromJson(Map<String, dynamic> json) {
  return _PostDetailModel.fromJson(json);
}

/// @nodoc
class _$PostDetailModelTearOff {
  const _$PostDetailModelTearOff();

  _PostDetailModel call(
      {@JsonKey(name: 'post_id') int postId = 0,
      List<String> imageURL = const [],
      int scrap = 0,
      bool isScrap = false,
      UserModel? user,
      int comment = 0,
      List<CommentModel> comments = const []}) {
    return _PostDetailModel(
      postId: postId,
      imageURL: imageURL,
      scrap: scrap,
      isScrap: isScrap,
      user: user,
      comment: comment,
      comments: comments,
    );
  }

  PostDetailModel fromJson(Map<String, Object?> json) {
    return PostDetailModel.fromJson(json);
  }
}

/// @nodoc
const $PostDetailModel = _$PostDetailModelTearOff();

/// @nodoc
mixin _$PostDetailModel {
  @JsonKey(name: 'post_id')
  int get postId => throw _privateConstructorUsedError;
  List<String> get imageURL => throw _privateConstructorUsedError;
  int get scrap => throw _privateConstructorUsedError;
  bool get isScrap => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;
  int get comment => throw _privateConstructorUsedError;
  List<CommentModel> get comments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostDetailModelCopyWith<PostDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostDetailModelCopyWith<$Res> {
  factory $PostDetailModelCopyWith(
          PostDetailModel value, $Res Function(PostDetailModel) then) =
      _$PostDetailModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'post_id') int postId,
      List<String> imageURL,
      int scrap,
      bool isScrap,
      UserModel? user,
      int comment,
      List<CommentModel> comments});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$PostDetailModelCopyWithImpl<$Res>
    implements $PostDetailModelCopyWith<$Res> {
  _$PostDetailModelCopyWithImpl(this._value, this._then);

  final PostDetailModel _value;
  // ignore: unused_field
  final $Res Function(PostDetailModel) _then;

  @override
  $Res call({
    Object? postId = freezed,
    Object? imageURL = freezed,
    Object? scrap = freezed,
    Object? isScrap = freezed,
    Object? user = freezed,
    Object? comment = freezed,
    Object? comments = freezed,
  }) {
    return _then(_value.copyWith(
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      imageURL: imageURL == freezed
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as List<String>,
      scrap: scrap == freezed
          ? _value.scrap
          : scrap // ignore: cast_nullable_to_non_nullable
              as int,
      isScrap: isScrap == freezed
          ? _value.isScrap
          : isScrap // ignore: cast_nullable_to_non_nullable
              as bool,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as int,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>,
    ));
  }

  @override
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$PostDetailModelCopyWith<$Res>
    implements $PostDetailModelCopyWith<$Res> {
  factory _$PostDetailModelCopyWith(
          _PostDetailModel value, $Res Function(_PostDetailModel) then) =
      __$PostDetailModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'post_id') int postId,
      List<String> imageURL,
      int scrap,
      bool isScrap,
      UserModel? user,
      int comment,
      List<CommentModel> comments});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$PostDetailModelCopyWithImpl<$Res>
    extends _$PostDetailModelCopyWithImpl<$Res>
    implements _$PostDetailModelCopyWith<$Res> {
  __$PostDetailModelCopyWithImpl(
      _PostDetailModel _value, $Res Function(_PostDetailModel) _then)
      : super(_value, (v) => _then(v as _PostDetailModel));

  @override
  _PostDetailModel get _value => super._value as _PostDetailModel;

  @override
  $Res call({
    Object? postId = freezed,
    Object? imageURL = freezed,
    Object? scrap = freezed,
    Object? isScrap = freezed,
    Object? user = freezed,
    Object? comment = freezed,
    Object? comments = freezed,
  }) {
    return _then(_PostDetailModel(
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      imageURL: imageURL == freezed
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as List<String>,
      scrap: scrap == freezed
          ? _value.scrap
          : scrap // ignore: cast_nullable_to_non_nullable
              as int,
      isScrap: isScrap == freezed
          ? _value.isScrap
          : isScrap // ignore: cast_nullable_to_non_nullable
              as bool,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as int,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostDetailModel implements _PostDetailModel {
  _$_PostDetailModel(
      {@JsonKey(name: 'post_id') this.postId = 0,
      this.imageURL = const [],
      this.scrap = 0,
      this.isScrap = false,
      this.user,
      this.comment = 0,
      this.comments = const []});

  factory _$_PostDetailModel.fromJson(Map<String, dynamic> json) =>
      _$$_PostDetailModelFromJson(json);

  @override
  @JsonKey(name: 'post_id')
  final int postId;
  @JsonKey()
  @override
  final List<String> imageURL;
  @JsonKey()
  @override
  final int scrap;
  @JsonKey()
  @override
  final bool isScrap;
  @override
  final UserModel? user;
  @JsonKey()
  @override
  final int comment;
  @JsonKey()
  @override
  final List<CommentModel> comments;

  @override
  String toString() {
    return 'PostDetailModel(postId: $postId, imageURL: $imageURL, scrap: $scrap, isScrap: $isScrap, user: $user, comment: $comment, comments: $comments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostDetailModel &&
            const DeepCollectionEquality().equals(other.postId, postId) &&
            const DeepCollectionEquality().equals(other.imageURL, imageURL) &&
            const DeepCollectionEquality().equals(other.scrap, scrap) &&
            const DeepCollectionEquality().equals(other.isScrap, isScrap) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality().equals(other.comments, comments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(postId),
      const DeepCollectionEquality().hash(imageURL),
      const DeepCollectionEquality().hash(scrap),
      const DeepCollectionEquality().hash(isScrap),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(comment),
      const DeepCollectionEquality().hash(comments));

  @JsonKey(ignore: true)
  @override
  _$PostDetailModelCopyWith<_PostDetailModel> get copyWith =>
      __$PostDetailModelCopyWithImpl<_PostDetailModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostDetailModelToJson(this);
  }
}

abstract class _PostDetailModel implements PostDetailModel {
  factory _PostDetailModel(
      {@JsonKey(name: 'post_id') int postId,
      List<String> imageURL,
      int scrap,
      bool isScrap,
      UserModel? user,
      int comment,
      List<CommentModel> comments}) = _$_PostDetailModel;

  factory _PostDetailModel.fromJson(Map<String, dynamic> json) =
      _$_PostDetailModel.fromJson;

  @override
  @JsonKey(name: 'post_id')
  int get postId;
  @override
  List<String> get imageURL;
  @override
  int get scrap;
  @override
  bool get isScrap;
  @override
  UserModel? get user;
  @override
  int get comment;
  @override
  List<CommentModel> get comments;
  @override
  @JsonKey(ignore: true)
  _$PostDetailModelCopyWith<_PostDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}
