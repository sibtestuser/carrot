// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vo_product_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductPost {
  SimpleProductPost get simpleProductPost => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductPostCopyWith<ProductPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductPostCopyWith<$Res> {
  factory $ProductPostCopyWith(
          ProductPost value, $Res Function(ProductPost) then) =
      _$ProductPostCopyWithImpl<$Res, ProductPost>;
  @useResult
  $Res call({SimpleProductPost simpleProductPost, String contents});

  $SimpleProductPostCopyWith<$Res> get simpleProductPost;
}

/// @nodoc
class _$ProductPostCopyWithImpl<$Res, $Val extends ProductPost>
    implements $ProductPostCopyWith<$Res> {
  _$ProductPostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? simpleProductPost = null,
    Object? contents = null,
  }) {
    return _then(_value.copyWith(
      simpleProductPost: null == simpleProductPost
          ? _value.simpleProductPost
          : simpleProductPost // ignore: cast_nullable_to_non_nullable
              as SimpleProductPost,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SimpleProductPostCopyWith<$Res> get simpleProductPost {
    return $SimpleProductPostCopyWith<$Res>(_value.simpleProductPost, (value) {
      return _then(_value.copyWith(simpleProductPost: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProductPostCopyWith<$Res>
    implements $ProductPostCopyWith<$Res> {
  factory _$$_ProductPostCopyWith(
          _$_ProductPost value, $Res Function(_$_ProductPost) then) =
      __$$_ProductPostCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SimpleProductPost simpleProductPost, String contents});

  @override
  $SimpleProductPostCopyWith<$Res> get simpleProductPost;
}

/// @nodoc
class __$$_ProductPostCopyWithImpl<$Res>
    extends _$ProductPostCopyWithImpl<$Res, _$_ProductPost>
    implements _$$_ProductPostCopyWith<$Res> {
  __$$_ProductPostCopyWithImpl(
      _$_ProductPost _value, $Res Function(_$_ProductPost) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? simpleProductPost = null,
    Object? contents = null,
  }) {
    return _then(_$_ProductPost(
      simpleProductPost: null == simpleProductPost
          ? _value.simpleProductPost
          : simpleProductPost // ignore: cast_nullable_to_non_nullable
              as SimpleProductPost,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ProductPost implements _ProductPost {
  const _$_ProductPost(
      {required this.simpleProductPost, required this.contents});

  @override
  final SimpleProductPost simpleProductPost;
  @override
  final String contents;

  @override
  String toString() {
    return 'ProductPost(simpleProductPost: $simpleProductPost, contents: $contents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductPost &&
            (identical(other.simpleProductPost, simpleProductPost) ||
                other.simpleProductPost == simpleProductPost) &&
            (identical(other.contents, contents) ||
                other.contents == contents));
  }

  @override
  int get hashCode => Object.hash(runtimeType, simpleProductPost, contents);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductPostCopyWith<_$_ProductPost> get copyWith =>
      __$$_ProductPostCopyWithImpl<_$_ProductPost>(this, _$identity);
}

abstract class _ProductPost implements ProductPost {
  const factory _ProductPost(
      {required final SimpleProductPost simpleProductPost,
      required final String contents}) = _$_ProductPost;

  @override
  SimpleProductPost get simpleProductPost;
  @override
  String get contents;
  @override
  @JsonKey(ignore: true)
  _$$_ProductPostCopyWith<_$_ProductPost> get copyWith =>
      throw _privateConstructorUsedError;
}
