// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_get_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PatientGetState {
  List<Patient> get patients => throw _privateConstructorUsedError;
  AppState get appState => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PatientGetStateCopyWith<PatientGetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientGetStateCopyWith<$Res> {
  factory $PatientGetStateCopyWith(
          PatientGetState value, $Res Function(PatientGetState) then) =
      _$PatientGetStateCopyWithImpl<$Res, PatientGetState>;
  @useResult
  $Res call({List<Patient> patients, AppState appState, String error});
}

/// @nodoc
class _$PatientGetStateCopyWithImpl<$Res, $Val extends PatientGetState>
    implements $PatientGetStateCopyWith<$Res> {
  _$PatientGetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patients = null,
    Object? appState = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      patients: null == patients
          ? _value.patients
          : patients // ignore: cast_nullable_to_non_nullable
              as List<Patient>,
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
abstract class _$$_PatientGetStateCopyWith<$Res>
    implements $PatientGetStateCopyWith<$Res> {
  factory _$$_PatientGetStateCopyWith(
          _$_PatientGetState value, $Res Function(_$_PatientGetState) then) =
      __$$_PatientGetStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Patient> patients, AppState appState, String error});
}

/// @nodoc
class __$$_PatientGetStateCopyWithImpl<$Res>
    extends _$PatientGetStateCopyWithImpl<$Res, _$_PatientGetState>
    implements _$$_PatientGetStateCopyWith<$Res> {
  __$$_PatientGetStateCopyWithImpl(
      _$_PatientGetState _value, $Res Function(_$_PatientGetState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patients = null,
    Object? appState = null,
    Object? error = null,
  }) {
    return _then(_$_PatientGetState(
      patients: null == patients
          ? _value._patients
          : patients // ignore: cast_nullable_to_non_nullable
              as List<Patient>,
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

class _$_PatientGetState implements _PatientGetState {
  const _$_PatientGetState(
      {final List<Patient> patients = const [],
      this.appState = AppState.initial,
      this.error = ""})
      : _patients = patients;

  final List<Patient> _patients;
  @override
  @JsonKey()
  List<Patient> get patients {
    if (_patients is EqualUnmodifiableListView) return _patients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_patients);
  }

  @override
  @JsonKey()
  final AppState appState;
  @override
  @JsonKey()
  final String error;

  @override
  String toString() {
    return 'PatientGetState(patients: $patients, appState: $appState, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PatientGetState &&
            const DeepCollectionEquality().equals(other._patients, _patients) &&
            (identical(other.appState, appState) ||
                other.appState == appState) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_patients), appState, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PatientGetStateCopyWith<_$_PatientGetState> get copyWith =>
      __$$_PatientGetStateCopyWithImpl<_$_PatientGetState>(this, _$identity);
}

abstract class _PatientGetState implements PatientGetState {
  const factory _PatientGetState(
      {final List<Patient> patients,
      final AppState appState,
      final String error}) = _$_PatientGetState;

  @override
  List<Patient> get patients;
  @override
  AppState get appState;
  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$_PatientGetStateCopyWith<_$_PatientGetState> get copyWith =>
      throw _privateConstructorUsedError;
}
