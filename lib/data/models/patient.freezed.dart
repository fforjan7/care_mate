// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Patient _$PatientFromJson(Map<String, dynamic> json) {
  return _Patient.fromJson(json);
}

/// @nodoc
mixin _$Patient {
  String get address => throw _privateConstructorUsedError;
  List<BloodPressure> get blood_pressures => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get date_of_birth => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get surname => throw _privateConstructorUsedError;
  List<Temperature> get temperatures => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PatientCopyWith<Patient> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientCopyWith<$Res> {
  factory $PatientCopyWith(Patient value, $Res Function(Patient) then) =
      _$PatientCopyWithImpl<$Res, Patient>;
  @useResult
  $Res call(
      {String address,
      List<BloodPressure> blood_pressures,
      String city,
      String date_of_birth,
      String id,
      String gender,
      String name,
      String surname,
      List<Temperature> temperatures});
}

/// @nodoc
class _$PatientCopyWithImpl<$Res, $Val extends Patient>
    implements $PatientCopyWith<$Res> {
  _$PatientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? blood_pressures = null,
    Object? city = null,
    Object? date_of_birth = null,
    Object? id = null,
    Object? gender = null,
    Object? name = null,
    Object? surname = null,
    Object? temperatures = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      blood_pressures: null == blood_pressures
          ? _value.blood_pressures
          : blood_pressures // ignore: cast_nullable_to_non_nullable
              as List<BloodPressure>,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      date_of_birth: null == date_of_birth
          ? _value.date_of_birth
          : date_of_birth // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surname: null == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      temperatures: null == temperatures
          ? _value.temperatures
          : temperatures // ignore: cast_nullable_to_non_nullable
              as List<Temperature>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PatientCopyWith<$Res> implements $PatientCopyWith<$Res> {
  factory _$$_PatientCopyWith(
          _$_Patient value, $Res Function(_$_Patient) then) =
      __$$_PatientCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String address,
      List<BloodPressure> blood_pressures,
      String city,
      String date_of_birth,
      String id,
      String gender,
      String name,
      String surname,
      List<Temperature> temperatures});
}

/// @nodoc
class __$$_PatientCopyWithImpl<$Res>
    extends _$PatientCopyWithImpl<$Res, _$_Patient>
    implements _$$_PatientCopyWith<$Res> {
  __$$_PatientCopyWithImpl(_$_Patient _value, $Res Function(_$_Patient) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? blood_pressures = null,
    Object? city = null,
    Object? date_of_birth = null,
    Object? id = null,
    Object? gender = null,
    Object? name = null,
    Object? surname = null,
    Object? temperatures = null,
  }) {
    return _then(_$_Patient(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      blood_pressures: null == blood_pressures
          ? _value._blood_pressures
          : blood_pressures // ignore: cast_nullable_to_non_nullable
              as List<BloodPressure>,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      date_of_birth: null == date_of_birth
          ? _value.date_of_birth
          : date_of_birth // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surname: null == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      temperatures: null == temperatures
          ? _value._temperatures
          : temperatures // ignore: cast_nullable_to_non_nullable
              as List<Temperature>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Patient implements _Patient {
  const _$_Patient(
      {this.address = "",
      final List<BloodPressure> blood_pressures = const [],
      this.city = "",
      this.date_of_birth = "",
      this.id = "",
      this.gender = "",
      this.name = "",
      this.surname = "",
      final List<Temperature> temperatures = const []})
      : _blood_pressures = blood_pressures,
        _temperatures = temperatures;

  factory _$_Patient.fromJson(Map<String, dynamic> json) =>
      _$$_PatientFromJson(json);

  @override
  @JsonKey()
  final String address;
  final List<BloodPressure> _blood_pressures;
  @override
  @JsonKey()
  List<BloodPressure> get blood_pressures {
    if (_blood_pressures is EqualUnmodifiableListView) return _blood_pressures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blood_pressures);
  }

  @override
  @JsonKey()
  final String city;
  @override
  @JsonKey()
  final String date_of_birth;
  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String gender;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String surname;
  final List<Temperature> _temperatures;
  @override
  @JsonKey()
  List<Temperature> get temperatures {
    if (_temperatures is EqualUnmodifiableListView) return _temperatures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_temperatures);
  }

  @override
  String toString() {
    return 'Patient(address: $address, blood_pressures: $blood_pressures, city: $city, date_of_birth: $date_of_birth, id: $id, gender: $gender, name: $name, surname: $surname, temperatures: $temperatures)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Patient &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other._blood_pressures, _blood_pressures) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.date_of_birth, date_of_birth) ||
                other.date_of_birth == date_of_birth) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.surname, surname) || other.surname == surname) &&
            const DeepCollectionEquality()
                .equals(other._temperatures, _temperatures));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      address,
      const DeepCollectionEquality().hash(_blood_pressures),
      city,
      date_of_birth,
      id,
      gender,
      name,
      surname,
      const DeepCollectionEquality().hash(_temperatures));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PatientCopyWith<_$_Patient> get copyWith =>
      __$$_PatientCopyWithImpl<_$_Patient>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PatientToJson(
      this,
    );
  }
}

abstract class _Patient implements Patient {
  const factory _Patient(
      {final String address,
      final List<BloodPressure> blood_pressures,
      final String city,
      final String date_of_birth,
      final String id,
      final String gender,
      final String name,
      final String surname,
      final List<Temperature> temperatures}) = _$_Patient;

  factory _Patient.fromJson(Map<String, dynamic> json) = _$_Patient.fromJson;

  @override
  String get address;
  @override
  List<BloodPressure> get blood_pressures;
  @override
  String get city;
  @override
  String get date_of_birth;
  @override
  String get id;
  @override
  String get gender;
  @override
  String get name;
  @override
  String get surname;
  @override
  List<Temperature> get temperatures;
  @override
  @JsonKey(ignore: true)
  _$$_PatientCopyWith<_$_Patient> get copyWith =>
      throw _privateConstructorUsedError;
}

BloodPressure _$BloodPressureFromJson(Map<String, dynamic> json) {
  return _BloodPressure.fromJson(json);
}

/// @nodoc
mixin _$BloodPressure {
  String get diastolic => throw _privateConstructorUsedError;
  String get systolic => throw _privateConstructorUsedError;
  String get measurement_time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BloodPressureCopyWith<BloodPressure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BloodPressureCopyWith<$Res> {
  factory $BloodPressureCopyWith(
          BloodPressure value, $Res Function(BloodPressure) then) =
      _$BloodPressureCopyWithImpl<$Res, BloodPressure>;
  @useResult
  $Res call({String diastolic, String systolic, String measurement_time});
}

/// @nodoc
class _$BloodPressureCopyWithImpl<$Res, $Val extends BloodPressure>
    implements $BloodPressureCopyWith<$Res> {
  _$BloodPressureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diastolic = null,
    Object? systolic = null,
    Object? measurement_time = null,
  }) {
    return _then(_value.copyWith(
      diastolic: null == diastolic
          ? _value.diastolic
          : diastolic // ignore: cast_nullable_to_non_nullable
              as String,
      systolic: null == systolic
          ? _value.systolic
          : systolic // ignore: cast_nullable_to_non_nullable
              as String,
      measurement_time: null == measurement_time
          ? _value.measurement_time
          : measurement_time // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BloodPressureCopyWith<$Res>
    implements $BloodPressureCopyWith<$Res> {
  factory _$$_BloodPressureCopyWith(
          _$_BloodPressure value, $Res Function(_$_BloodPressure) then) =
      __$$_BloodPressureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String diastolic, String systolic, String measurement_time});
}

/// @nodoc
class __$$_BloodPressureCopyWithImpl<$Res>
    extends _$BloodPressureCopyWithImpl<$Res, _$_BloodPressure>
    implements _$$_BloodPressureCopyWith<$Res> {
  __$$_BloodPressureCopyWithImpl(
      _$_BloodPressure _value, $Res Function(_$_BloodPressure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diastolic = null,
    Object? systolic = null,
    Object? measurement_time = null,
  }) {
    return _then(_$_BloodPressure(
      diastolic: null == diastolic
          ? _value.diastolic
          : diastolic // ignore: cast_nullable_to_non_nullable
              as String,
      systolic: null == systolic
          ? _value.systolic
          : systolic // ignore: cast_nullable_to_non_nullable
              as String,
      measurement_time: null == measurement_time
          ? _value.measurement_time
          : measurement_time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BloodPressure implements _BloodPressure {
  const _$_BloodPressure(
      {this.diastolic = "", this.systolic = "", this.measurement_time = ""});

  factory _$_BloodPressure.fromJson(Map<String, dynamic> json) =>
      _$$_BloodPressureFromJson(json);

  @override
  @JsonKey()
  final String diastolic;
  @override
  @JsonKey()
  final String systolic;
  @override
  @JsonKey()
  final String measurement_time;

  @override
  String toString() {
    return 'BloodPressure(diastolic: $diastolic, systolic: $systolic, measurement_time: $measurement_time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BloodPressure &&
            (identical(other.diastolic, diastolic) ||
                other.diastolic == diastolic) &&
            (identical(other.systolic, systolic) ||
                other.systolic == systolic) &&
            (identical(other.measurement_time, measurement_time) ||
                other.measurement_time == measurement_time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, diastolic, systolic, measurement_time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BloodPressureCopyWith<_$_BloodPressure> get copyWith =>
      __$$_BloodPressureCopyWithImpl<_$_BloodPressure>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BloodPressureToJson(
      this,
    );
  }
}

abstract class _BloodPressure implements BloodPressure {
  const factory _BloodPressure(
      {final String diastolic,
      final String systolic,
      final String measurement_time}) = _$_BloodPressure;

  factory _BloodPressure.fromJson(Map<String, dynamic> json) =
      _$_BloodPressure.fromJson;

  @override
  String get diastolic;
  @override
  String get systolic;
  @override
  String get measurement_time;
  @override
  @JsonKey(ignore: true)
  _$$_BloodPressureCopyWith<_$_BloodPressure> get copyWith =>
      throw _privateConstructorUsedError;
}

Temperature _$TemperatureFromJson(Map<String, dynamic> json) {
  return _Temperature.fromJson(json);
}

/// @nodoc
mixin _$Temperature {
  String get measurement_value => throw _privateConstructorUsedError;
  String get measurement_time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TemperatureCopyWith<Temperature> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemperatureCopyWith<$Res> {
  factory $TemperatureCopyWith(
          Temperature value, $Res Function(Temperature) then) =
      _$TemperatureCopyWithImpl<$Res, Temperature>;
  @useResult
  $Res call({String measurement_value, String measurement_time});
}

/// @nodoc
class _$TemperatureCopyWithImpl<$Res, $Val extends Temperature>
    implements $TemperatureCopyWith<$Res> {
  _$TemperatureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? measurement_value = null,
    Object? measurement_time = null,
  }) {
    return _then(_value.copyWith(
      measurement_value: null == measurement_value
          ? _value.measurement_value
          : measurement_value // ignore: cast_nullable_to_non_nullable
              as String,
      measurement_time: null == measurement_time
          ? _value.measurement_time
          : measurement_time // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TemperatureCopyWith<$Res>
    implements $TemperatureCopyWith<$Res> {
  factory _$$_TemperatureCopyWith(
          _$_Temperature value, $Res Function(_$_Temperature) then) =
      __$$_TemperatureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String measurement_value, String measurement_time});
}

/// @nodoc
class __$$_TemperatureCopyWithImpl<$Res>
    extends _$TemperatureCopyWithImpl<$Res, _$_Temperature>
    implements _$$_TemperatureCopyWith<$Res> {
  __$$_TemperatureCopyWithImpl(
      _$_Temperature _value, $Res Function(_$_Temperature) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? measurement_value = null,
    Object? measurement_time = null,
  }) {
    return _then(_$_Temperature(
      measurement_value: null == measurement_value
          ? _value.measurement_value
          : measurement_value // ignore: cast_nullable_to_non_nullable
              as String,
      measurement_time: null == measurement_time
          ? _value.measurement_time
          : measurement_time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Temperature implements _Temperature {
  const _$_Temperature(
      {this.measurement_value = "", this.measurement_time = ""});

  factory _$_Temperature.fromJson(Map<String, dynamic> json) =>
      _$$_TemperatureFromJson(json);

  @override
  @JsonKey()
  final String measurement_value;
  @override
  @JsonKey()
  final String measurement_time;

  @override
  String toString() {
    return 'Temperature(measurement_value: $measurement_value, measurement_time: $measurement_time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Temperature &&
            (identical(other.measurement_value, measurement_value) ||
                other.measurement_value == measurement_value) &&
            (identical(other.measurement_time, measurement_time) ||
                other.measurement_time == measurement_time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, measurement_value, measurement_time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TemperatureCopyWith<_$_Temperature> get copyWith =>
      __$$_TemperatureCopyWithImpl<_$_Temperature>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TemperatureToJson(
      this,
    );
  }
}

abstract class _Temperature implements Temperature {
  const factory _Temperature(
      {final String measurement_value,
      final String measurement_time}) = _$_Temperature;

  factory _Temperature.fromJson(Map<String, dynamic> json) =
      _$_Temperature.fromJson;

  @override
  String get measurement_value;
  @override
  String get measurement_time;
  @override
  @JsonKey(ignore: true)
  _$$_TemperatureCopyWith<_$_Temperature> get copyWith =>
      throw _privateConstructorUsedError;
}
