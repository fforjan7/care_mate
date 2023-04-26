// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'beds_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BedsState {
  String get name => throw _privateConstructorUsedError;
  AppState get appState => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BedsStateCopyWith<BedsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BedsStateCopyWith<$Res> {
  factory $BedsStateCopyWith(BedsState value, $Res Function(BedsState) then) =
      _$BedsStateCopyWithImpl<$Res, BedsState>;
  @useResult
  $Res call({String name, AppState appState, String error});
}

/// @nodoc
class _$BedsStateCopyWithImpl<$Res, $Val extends BedsState>
    implements $BedsStateCopyWith<$Res> {
  _$BedsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? appState = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      appState: null == appState
          ? _value.appState
          : appState // ignore: cast_nullable_to_non_nullable
              as AppState,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BedsStateCopyWith<$Res> implements $BedsStateCopyWith<$Res> {
  factory _$$_BedsStateCopyWith(
          _$_BedsState value, $Res Function(_$_BedsState) then) =
      __$$_BedsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, AppState appState, String error});
}

/// @nodoc
class __$$_BedsStateCopyWithImpl<$Res>
    extends _$BedsStateCopyWithImpl<$Res, _$_BedsState>
    implements _$$_BedsStateCopyWith<$Res> {
  __$$_BedsStateCopyWithImpl(
      _$_BedsState _value, $Res Function(_$_BedsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? appState = null,
    Object? error = null,
  }) {
    return _then(_$_BedsState(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      appState: null == appState
          ? _value.appState
          : appState // ignore: cast_nullable_to_non_nullable
              as AppState,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_BedsState implements _BedsState {
  const _$_BedsState(
      {this.name = "", this.appState = AppState.initial, this.error = ""});

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final AppState appState;
  @override
  @JsonKey()
  final String error;

  @override
  String toString() {
    return 'BedsState(name: $name, appState: $appState, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BedsState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.appState, appState) ||
                other.appState == appState) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, appState, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BedsStateCopyWith<_$_BedsState> get copyWith =>
      __$$_BedsStateCopyWithImpl<_$_BedsState>(this, _$identity);
}

abstract class _BedsState implements BedsState {
  const factory _BedsState(
      {final String name,
      final AppState appState,
      final String error}) = _$_BedsState;

  @override
  String get name;
  @override
  AppState get appState;
  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$_BedsStateCopyWith<_$_BedsState> get copyWith =>
      throw _privateConstructorUsedError;
}
