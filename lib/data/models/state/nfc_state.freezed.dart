// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nfc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NfcState {
  String get id => throw _privateConstructorUsedError;
  AppState get appState => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NfcStateCopyWith<NfcState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NfcStateCopyWith<$Res> {
  factory $NfcStateCopyWith(NfcState value, $Res Function(NfcState) then) =
      _$NfcStateCopyWithImpl<$Res, NfcState>;
  @useResult
  $Res call({String id, AppState appState, String error});
}

/// @nodoc
class _$NfcStateCopyWithImpl<$Res, $Val extends NfcState>
    implements $NfcStateCopyWith<$Res> {
  _$NfcStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? appState = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_NfcStateCopyWith<$Res> implements $NfcStateCopyWith<$Res> {
  factory _$$_NfcStateCopyWith(
          _$_NfcState value, $Res Function(_$_NfcState) then) =
      __$$_NfcStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, AppState appState, String error});
}

/// @nodoc
class __$$_NfcStateCopyWithImpl<$Res>
    extends _$NfcStateCopyWithImpl<$Res, _$_NfcState>
    implements _$$_NfcStateCopyWith<$Res> {
  __$$_NfcStateCopyWithImpl(
      _$_NfcState _value, $Res Function(_$_NfcState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? appState = null,
    Object? error = null,
  }) {
    return _then(_$_NfcState(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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

class _$_NfcState implements _NfcState {
  const _$_NfcState(
      {this.id = "", this.appState = AppState.initial, this.error = ""});

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final AppState appState;
  @override
  @JsonKey()
  final String error;

  @override
  String toString() {
    return 'NfcState(id: $id, appState: $appState, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NfcState &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.appState, appState) ||
                other.appState == appState) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, appState, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NfcStateCopyWith<_$_NfcState> get copyWith =>
      __$$_NfcStateCopyWithImpl<_$_NfcState>(this, _$identity);
}

abstract class _NfcState implements NfcState {
  const factory _NfcState(
      {final String id,
      final AppState appState,
      final String error}) = _$_NfcState;

  @override
  String get id;
  @override
  AppState get appState;
  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$_NfcStateCopyWith<_$_NfcState> get copyWith =>
      throw _privateConstructorUsedError;
}
