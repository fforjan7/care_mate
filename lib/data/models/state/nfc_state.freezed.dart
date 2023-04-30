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
  String get nfcId => throw _privateConstructorUsedError;
  Bed get bed => throw _privateConstructorUsedError;
  Patient get patient => throw _privateConstructorUsedError;
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
  $Res call(
      {String nfcId,
      Bed bed,
      Patient patient,
      AppState appState,
      String error});

  $BedCopyWith<$Res> get bed;
  $PatientCopyWith<$Res> get patient;
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
    Object? nfcId = null,
    Object? bed = null,
    Object? patient = null,
    Object? appState = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      nfcId: null == nfcId
          ? _value.nfcId
          : nfcId // ignore: cast_nullable_to_non_nullable
              as String,
      bed: null == bed
          ? _value.bed
          : bed // ignore: cast_nullable_to_non_nullable
              as Bed,
      patient: null == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as Patient,
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

  @override
  @pragma('vm:prefer-inline')
  $BedCopyWith<$Res> get bed {
    return $BedCopyWith<$Res>(_value.bed, (value) {
      return _then(_value.copyWith(bed: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PatientCopyWith<$Res> get patient {
    return $PatientCopyWith<$Res>(_value.patient, (value) {
      return _then(_value.copyWith(patient: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NfcStateCopyWith<$Res> implements $NfcStateCopyWith<$Res> {
  factory _$$_NfcStateCopyWith(
          _$_NfcState value, $Res Function(_$_NfcState) then) =
      __$$_NfcStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nfcId,
      Bed bed,
      Patient patient,
      AppState appState,
      String error});

  @override
  $BedCopyWith<$Res> get bed;
  @override
  $PatientCopyWith<$Res> get patient;
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
    Object? nfcId = null,
    Object? bed = null,
    Object? patient = null,
    Object? appState = null,
    Object? error = null,
  }) {
    return _then(_$_NfcState(
      nfcId: null == nfcId
          ? _value.nfcId
          : nfcId // ignore: cast_nullable_to_non_nullable
              as String,
      bed: null == bed
          ? _value.bed
          : bed // ignore: cast_nullable_to_non_nullable
              as Bed,
      patient: null == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as Patient,
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
      {this.nfcId = "",
      this.bed = const Bed(),
      this.patient = const Patient(),
      this.appState = AppState.initial,
      this.error = ""});

  @override
  @JsonKey()
  final String nfcId;
  @override
  @JsonKey()
  final Bed bed;
  @override
  @JsonKey()
  final Patient patient;
  @override
  @JsonKey()
  final AppState appState;
  @override
  @JsonKey()
  final String error;

  @override
  String toString() {
    return 'NfcState(nfcId: $nfcId, bed: $bed, patient: $patient, appState: $appState, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NfcState &&
            (identical(other.nfcId, nfcId) || other.nfcId == nfcId) &&
            (identical(other.bed, bed) || other.bed == bed) &&
            (identical(other.patient, patient) || other.patient == patient) &&
            (identical(other.appState, appState) ||
                other.appState == appState) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, nfcId, bed, patient, appState, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NfcStateCopyWith<_$_NfcState> get copyWith =>
      __$$_NfcStateCopyWithImpl<_$_NfcState>(this, _$identity);
}

abstract class _NfcState implements NfcState {
  const factory _NfcState(
      {final String nfcId,
      final Bed bed,
      final Patient patient,
      final AppState appState,
      final String error}) = _$_NfcState;

  @override
  String get nfcId;
  @override
  Bed get bed;
  @override
  Patient get patient;
  @override
  AppState get appState;
  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$_NfcStateCopyWith<_$_NfcState> get copyWith =>
      throw _privateConstructorUsedError;
}
