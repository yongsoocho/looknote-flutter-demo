// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostListModel _$PostListModelFromJson(Map<String, dynamic> json) {
  return _PostListModel.fromJson(json);
}

/// @nodoc
class _$PostListModelTearOff {
  const _$PostListModelTearOff();

  _PostListModel call({List<PostModel>? posts, PaginationModel? pagenation}) {
    return _PostListModel(
      posts: posts,
      pagenation: pagenation,
    );
  }

  PostListModel fromJson(Map<String, Object?> json) {
    return PostListModel.fromJson(json);
  }
}

/// @nodoc
const $PostListModel = _$PostListModelTearOff();

/// @nodoc
mixin _$PostListModel {
  List<PostModel>? get posts => throw _privateConstructorUsedError;
  PaginationModel? get pagenation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostListModelCopyWith<PostListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostListModelCopyWith<$Res> {
  factory $PostListModelCopyWith(
          PostListModel value, $Res Function(PostListModel) then) =
      _$PostListModelCopyWithImpl<$Res>;
  $Res call({List<PostModel>? posts, PaginationModel? pagenation});

  $PaginationModelCopyWith<$Res>? get pagenation;
}

/// @nodoc
class _$PostListModelCopyWithImpl<$Res>
    implements $PostListModelCopyWith<$Res> {
  _$PostListModelCopyWithImpl(this._value, this._then);

  final PostListModel _value;
  // ignore: unused_field
  final $Res Function(PostListModel) _then;

  @override
  $Res call({
    Object? posts = freezed,
    Object? pagenation = freezed,
  }) {
    return _then(_value.copyWith(
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostModel>?,
      pagenation: pagenation == freezed
          ? _value.pagenation
          : pagenation // ignore: cast_nullable_to_non_nullable
              as PaginationModel?,
    ));
  }

  @override
  $PaginationModelCopyWith<$Res>? get pagenation {
    if (_value.pagenation == null) {
      return null;
    }

    return $PaginationModelCopyWith<$Res>(_value.pagenation!, (value) {
      return _then(_value.copyWith(pagenation: value));
    });
  }
}

/// @nodoc
abstract class _$PostListModelCopyWith<$Res>
    implements $PostListModelCopyWith<$Res> {
  factory _$PostListModelCopyWith(
          _PostListModel value, $Res Function(_PostListModel) then) =
      __$PostListModelCopyWithImpl<$Res>;
  @override
  $Res call({List<PostModel>? posts, PaginationModel? pagenation});

  @override
  $PaginationModelCopyWith<$Res>? get pagenation;
}

/// @nodoc
class __$PostListModelCopyWithImpl<$Res>
    extends _$PostListModelCopyWithImpl<$Res>
    implements _$PostListModelCopyWith<$Res> {
  __$PostListModelCopyWithImpl(
      _PostListModel _value, $Res Function(_PostListModel) _then)
      : super(_value, (v) => _then(v as _PostListModel));

  @override
  _PostListModel get _value => super._value as _PostListModel;

  @override
  $Res call({
    Object? posts = freezed,
    Object? pagenation = freezed,
  }) {
    return _then(_PostListModel(
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostModel>?,
      pagenation: pagenation == freezed
          ? _value.pagenation
          : pagenation // ignore: cast_nullable_to_non_nullable
              as PaginationModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostListModel implements _PostListModel {
  _$_PostListModel({this.posts, this.pagenation});

  factory _$_PostListModel.fromJson(Map<String, dynamic> json) =>
      _$$_PostListModelFromJson(json);

  @override
  final List<PostModel>? posts;
  @override
  final PaginationModel? pagenation;

  @override
  String toString() {
    return 'PostListModel(posts: $posts, pagenation: $pagenation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostListModel &&
            const DeepCollectionEquality().equals(other.posts, posts) &&
            const DeepCollectionEquality()
                .equals(other.pagenation, pagenation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(posts),
      const DeepCollectionEquality().hash(pagenation));

  @JsonKey(ignore: true)
  @override
  _$PostListModelCopyWith<_PostListModel> get copyWith =>
      __$PostListModelCopyWithImpl<_PostListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostListModelToJson(this);
  }
}

abstract class _PostListModel implements PostListModel {
  factory _PostListModel(
      {List<PostModel>? posts, PaginationModel? pagenation}) = _$_PostListModel;

  factory _PostListModel.fromJson(Map<String, dynamic> json) =
      _$_PostListModel.fromJson;

  @override
  List<PostModel>? get posts;
  @override
  PaginationModel? get pagenation;
  @override
  @JsonKey(ignore: true)
  _$PostListModelCopyWith<_PostListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
