// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'w_floating_button_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FloatingButtonSate {
  bool get isExpanded => throw _privateConstructorUsedError;
  bool get isSmall => throw _privateConstructorUsedError;
  bool get isHided => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FloatingButtonSateCopyWith<FloatingButtonSate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FloatingButtonSateCopyWith<$Res> {
  factory $FloatingButtonSateCopyWith(
          FloatingButtonSate value, $Res Function(FloatingButtonSate) then) =
      _$FloatingButtonSateCopyWithImpl<$Res, FloatingButtonSate>;
  @useResult
  $Res call({bool isExpanded, bool isSmall, bool isHided});
}

/// @nodoc
class _$FloatingButtonSateCopyWithImpl<$Res, $Val extends FloatingButtonSate>
    implements $FloatingButtonSateCopyWith<$Res> {
  _$FloatingButtonSateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isExpanded = null,
    Object? isSmall = null,
    Object? isHided = null,
  }) {
    return _then(_value.copyWith(
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      isSmall: null == isSmall
          ? _value.isSmall
          : isSmall // ignore: cast_nullable_to_non_nullable
              as bool,
      isHided: null == isHided
          ? _value.isHided
          : isHided // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FloatingButtonSateCopyWith<$Res>
    implements $FloatingButtonSateCopyWith<$Res> {
  factory _$$_FloatingButtonSateCopyWith(_$_FloatingButtonSate value,
          $Res Function(_$_FloatingButtonSate) then) =
      __$$_FloatingButtonSateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isExpanded, bool isSmall, bool isHided});
}

/// @nodoc
class __$$_FloatingButtonSateCopyWithImpl<$Res>
    extends _$FloatingButtonSateCopyWithImpl<$Res, _$_FloatingButtonSate>
    implements _$$_FloatingButtonSateCopyWith<$Res> {
  __$$_FloatingButtonSateCopyWithImpl(
      _$_FloatingButtonSate _value, $Res Function(_$_FloatingButtonSate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isExpanded = null,
    Object? isSmall = null,
    Object? isHided = null,
  }) {
    return _then(_$_FloatingButtonSate(
      null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      null == isSmall
          ? _value.isSmall
          : isSmall // ignore: cast_nullable_to_non_nullable
              as bool,
      null == isHided
          ? _value.isHided
          : isHided // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FloatingButtonSate implements _FloatingButtonSate {
  const _$_FloatingButtonSate(this.isExpanded, this.isSmall, this.isHided);

  @override
  final bool isExpanded;
  @override
  final bool isSmall;
  @override
  final bool isHided;

  @override
  String toString() {
    return 'FloatingButtonSate(isExpanded: $isExpanded, isSmall: $isSmall, isHided: $isHided)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FloatingButtonSate &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded) &&
            (identical(other.isSmall, isSmall) || other.isSmall == isSmall) &&
            (identical(other.isHided, isHided) || other.isHided == isHided));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isExpanded, isSmall, isHided);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FloatingButtonSateCopyWith<_$_FloatingButtonSate> get copyWith =>
      __$$_FloatingButtonSateCopyWithImpl<_$_FloatingButtonSate>(
          this, _$identity);
}

abstract class _FloatingButtonSate implements FloatingButtonSate {
  const factory _FloatingButtonSate(
          final bool isExpanded, final bool isSmall, final bool isHided) =
      _$_FloatingButtonSate;

  @override
  bool get isExpanded;
  @override
  bool get isSmall;
  @override
  bool get isHided;
  @override
  @JsonKey(ignore: true)
  _$$_FloatingButtonSateCopyWith<_$_FloatingButtonSate> get copyWith =>
      throw _privateConstructorUsedError;
}
