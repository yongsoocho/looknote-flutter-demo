// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comment_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommentListModel _$CommentListModelFromJson(Map<String, dynamic> json) {
  return _CommentListModel.fromJson(json);
}

/// @nodoc
class _$CommentListModelTearOff {
  const _$CommentListModelTearOff();

  _CommentListModel call(
      {List<CommentModel>? comments, PaginationModel? pagenation}) {
    return _CommentListModel(
      comments: comments,
      pagenation: pagenation,
    );
  }

  CommentListModel fromJson(Map<String, Object?> json) {
    return CommentListModel.fromJson(json);
  }
}

/// @nodoc
const $CommentListModel = _$CommentListModelTearOff();

/// @nodoc
mixin _$CommentListModel {
  List<CommentModel>? get comments => throw _privateConstructorUsedError;
  PaginationModel? get pagenation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentListModelCopyWith<CommentListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentListModelCopyWith<$Res> {
  factory $CommentListModelCopyWith(
          CommentListModel value, $Res Function(CommentListModel) then) =
      _$CommentListModelCopyWithImpl<$Res>;
  $Res call({List<CommentModel>? comments, PaginationModel? pagenation});

  $PaginationModelCopyWith<$Res>? get pagenation;
}

/// @nodoc
class _$CommentListModelCopyWithImpl<$Res>
    implements $CommentListModelCopyWith<$Res> {
  _$CommentListModelCopyWithImpl(this._value, this._then);

  final CommentListModel _value;
  // ignore: unused_field
  final $Res Function(CommentListModel) _then;

  @override
  $Res call({
    Object? comments = freezed,
    Object? pagenation = freezed,
  }) {
    return _then(_value.copyWith(
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>?,
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
abstract class _$CommentListModelCopyWith<$Res>
    implements $CommentListModelCopyWith<$Res> {
  factory _$CommentListModelCopyWith(
          _CommentListModel value, $Res Function(_CommentListModel) then) =
      __$CommentListModelCopyWithImpl<$Res>;
  @override
  $Res call({List<CommentModel>? comments, PaginationModel? pagenation});

  @override
  $PaginationModelCopyWith<$Res>? get pagenation;
}

/// @nodoc
class __$CommentListModelCopyWithImpl<$Res>
    extends _$CommentListModelCopyWithImpl<$Res>
    implements _$CommentListModelCopyWith<$Res> {
  __$CommentListModelCopyWithImpl(
      _CommentListModel _value, $Res Function(_CommentListModel) _then)
      : super(_value, (v) => _then(v as _CommentListModel));

  @override
  _CommentListModel get _value => super._value as _CommentListModel;

  @override
  $Res call({
    Object? comments = freezed,
    Object? pagenation = freezed,
  }) {
    return _then(_CommentListModel(
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>?,
      pagenation: pagenation == freezed
          ? _value.pagenation
          : pagenation // ignore: cast_nullable_to_non_nullable
              as PaginationModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommentListModel implements _CommentListModel {
  _$_CommentListModel({this.comments, this.pagenation});

  factory _$_CommentListModel.fromJson(Map<String, dynamic> json) =>
      _$$_CommentListModelFromJson(json);

  @override
  final List<CommentModel>? comments;
  @override
  final PaginationModel? pagenation;

  @override
  String toString() {
    return 'CommentListModel(comments: $comments, pagenation: $pagenation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CommentListModel &&
            const DeepCollectionEquality().equals(other.comments, comments) &&
            const DeepCollectionEquality()
                .equals(other.pagenation, pagenation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(comments),
      const DeepCollectionEquality().hash(pagenation));

  @JsonKey(ignore: true)
  @override
  _$CommentListModelCopyWith<_CommentListModel> get copyWith =>
      __$CommentListModelCopyWithImpl<_CommentListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentListModelToJson(this);
  }
}

abstract class _CommentListModel implements CommentListModel {
  factory _CommentListModel(
      {List<CommentModel>? comments,
      PaginationModel? pagenation}) = _$_CommentListModel;

  factory _CommentListModel.fromJson(Map<String, dynamic> json) =
      _$_CommentListModel.fromJson;

  @override
  List<CommentModel>? get comments;
  @override
  PaginationModel? get pagenation;
  @override
  @JsonKey(ignore: true)
  _$CommentListModelCopyWith<_CommentListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
