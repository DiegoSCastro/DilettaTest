// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wishlist_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WishlistState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> wishlist) success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> wishlist)? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> wishlist)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WishlistInitial value) initial,
    required TResult Function(WishlistLoading value) loading,
    required TResult Function(WishlistSuccess value) success,
    required TResult Function(WishlistError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WishlistInitial value)? initial,
    TResult? Function(WishlistLoading value)? loading,
    TResult? Function(WishlistSuccess value)? success,
    TResult? Function(WishlistError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WishlistInitial value)? initial,
    TResult Function(WishlistLoading value)? loading,
    TResult Function(WishlistSuccess value)? success,
    TResult Function(WishlistError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WishlistStateCopyWith<$Res> {
  factory $WishlistStateCopyWith(
          WishlistState value, $Res Function(WishlistState) then) =
      _$WishlistStateCopyWithImpl<$Res, WishlistState>;
}

/// @nodoc
class _$WishlistStateCopyWithImpl<$Res, $Val extends WishlistState>
    implements $WishlistStateCopyWith<$Res> {
  _$WishlistStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WishlistState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$WishlistInitialImplCopyWith<$Res> {
  factory _$$WishlistInitialImplCopyWith(_$WishlistInitialImpl value,
          $Res Function(_$WishlistInitialImpl) then) =
      __$$WishlistInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WishlistInitialImplCopyWithImpl<$Res>
    extends _$WishlistStateCopyWithImpl<$Res, _$WishlistInitialImpl>
    implements _$$WishlistInitialImplCopyWith<$Res> {
  __$$WishlistInitialImplCopyWithImpl(
      _$WishlistInitialImpl _value, $Res Function(_$WishlistInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of WishlistState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$WishlistInitialImpl implements WishlistInitial {
  const _$WishlistInitialImpl();

  @override
  String toString() {
    return 'WishlistState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WishlistInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> wishlist) success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> wishlist)? success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> wishlist)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WishlistInitial value) initial,
    required TResult Function(WishlistLoading value) loading,
    required TResult Function(WishlistSuccess value) success,
    required TResult Function(WishlistError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WishlistInitial value)? initial,
    TResult? Function(WishlistLoading value)? loading,
    TResult? Function(WishlistSuccess value)? success,
    TResult? Function(WishlistError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WishlistInitial value)? initial,
    TResult Function(WishlistLoading value)? loading,
    TResult Function(WishlistSuccess value)? success,
    TResult Function(WishlistError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class WishlistInitial implements WishlistState {
  const factory WishlistInitial() = _$WishlistInitialImpl;
}

/// @nodoc
abstract class _$$WishlistLoadingImplCopyWith<$Res> {
  factory _$$WishlistLoadingImplCopyWith(_$WishlistLoadingImpl value,
          $Res Function(_$WishlistLoadingImpl) then) =
      __$$WishlistLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WishlistLoadingImplCopyWithImpl<$Res>
    extends _$WishlistStateCopyWithImpl<$Res, _$WishlistLoadingImpl>
    implements _$$WishlistLoadingImplCopyWith<$Res> {
  __$$WishlistLoadingImplCopyWithImpl(
      _$WishlistLoadingImpl _value, $Res Function(_$WishlistLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of WishlistState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$WishlistLoadingImpl implements WishlistLoading {
  const _$WishlistLoadingImpl();

  @override
  String toString() {
    return 'WishlistState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WishlistLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> wishlist) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> wishlist)? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> wishlist)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WishlistInitial value) initial,
    required TResult Function(WishlistLoading value) loading,
    required TResult Function(WishlistSuccess value) success,
    required TResult Function(WishlistError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WishlistInitial value)? initial,
    TResult? Function(WishlistLoading value)? loading,
    TResult? Function(WishlistSuccess value)? success,
    TResult? Function(WishlistError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WishlistInitial value)? initial,
    TResult Function(WishlistLoading value)? loading,
    TResult Function(WishlistSuccess value)? success,
    TResult Function(WishlistError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class WishlistLoading implements WishlistState {
  const factory WishlistLoading() = _$WishlistLoadingImpl;
}

/// @nodoc
abstract class _$$WishlistSuccessImplCopyWith<$Res> {
  factory _$$WishlistSuccessImplCopyWith(_$WishlistSuccessImpl value,
          $Res Function(_$WishlistSuccessImpl) then) =
      __$$WishlistSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Product> wishlist});
}

/// @nodoc
class __$$WishlistSuccessImplCopyWithImpl<$Res>
    extends _$WishlistStateCopyWithImpl<$Res, _$WishlistSuccessImpl>
    implements _$$WishlistSuccessImplCopyWith<$Res> {
  __$$WishlistSuccessImplCopyWithImpl(
      _$WishlistSuccessImpl _value, $Res Function(_$WishlistSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of WishlistState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wishlist = null,
  }) {
    return _then(_$WishlistSuccessImpl(
      wishlist: null == wishlist
          ? _value._wishlist
          : wishlist // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class _$WishlistSuccessImpl implements WishlistSuccess {
  const _$WishlistSuccessImpl({final List<Product> wishlist = const []})
      : _wishlist = wishlist;

  final List<Product> _wishlist;
  @override
  @JsonKey()
  List<Product> get wishlist {
    if (_wishlist is EqualUnmodifiableListView) return _wishlist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wishlist);
  }

  @override
  String toString() {
    return 'WishlistState.success(wishlist: $wishlist)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WishlistSuccessImpl &&
            const DeepCollectionEquality().equals(other._wishlist, _wishlist));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_wishlist));

  /// Create a copy of WishlistState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WishlistSuccessImplCopyWith<_$WishlistSuccessImpl> get copyWith =>
      __$$WishlistSuccessImplCopyWithImpl<_$WishlistSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> wishlist) success,
    required TResult Function(String message) error,
  }) {
    return success(wishlist);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> wishlist)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(wishlist);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> wishlist)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(wishlist);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WishlistInitial value) initial,
    required TResult Function(WishlistLoading value) loading,
    required TResult Function(WishlistSuccess value) success,
    required TResult Function(WishlistError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WishlistInitial value)? initial,
    TResult? Function(WishlistLoading value)? loading,
    TResult? Function(WishlistSuccess value)? success,
    TResult? Function(WishlistError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WishlistInitial value)? initial,
    TResult Function(WishlistLoading value)? loading,
    TResult Function(WishlistSuccess value)? success,
    TResult Function(WishlistError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class WishlistSuccess implements WishlistState {
  const factory WishlistSuccess({final List<Product> wishlist}) =
      _$WishlistSuccessImpl;

  List<Product> get wishlist;

  /// Create a copy of WishlistState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WishlistSuccessImplCopyWith<_$WishlistSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WishlistErrorImplCopyWith<$Res> {
  factory _$$WishlistErrorImplCopyWith(
          _$WishlistErrorImpl value, $Res Function(_$WishlistErrorImpl) then) =
      __$$WishlistErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$WishlistErrorImplCopyWithImpl<$Res>
    extends _$WishlistStateCopyWithImpl<$Res, _$WishlistErrorImpl>
    implements _$$WishlistErrorImplCopyWith<$Res> {
  __$$WishlistErrorImplCopyWithImpl(
      _$WishlistErrorImpl _value, $Res Function(_$WishlistErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of WishlistState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$WishlistErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WishlistErrorImpl implements WishlistError {
  const _$WishlistErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'WishlistState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WishlistErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of WishlistState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WishlistErrorImplCopyWith<_$WishlistErrorImpl> get copyWith =>
      __$$WishlistErrorImplCopyWithImpl<_$WishlistErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> wishlist) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> wishlist)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> wishlist)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WishlistInitial value) initial,
    required TResult Function(WishlistLoading value) loading,
    required TResult Function(WishlistSuccess value) success,
    required TResult Function(WishlistError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WishlistInitial value)? initial,
    TResult? Function(WishlistLoading value)? loading,
    TResult? Function(WishlistSuccess value)? success,
    TResult? Function(WishlistError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WishlistInitial value)? initial,
    TResult Function(WishlistLoading value)? loading,
    TResult Function(WishlistSuccess value)? success,
    TResult Function(WishlistError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class WishlistError implements WishlistState {
  const factory WishlistError({required final String message}) =
      _$WishlistErrorImpl;

  String get message;

  /// Create a copy of WishlistState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WishlistErrorImplCopyWith<_$WishlistErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
