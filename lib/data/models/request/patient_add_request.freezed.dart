// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_add_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PatientAddRequest _$PatientAddRequestFromJson(Map<String, dynamic> json) {
  return _PatientAddRequest.fromJson(json);
}

/// @nodoc
mixin _$PatientAddRequest {
  String get adress => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get date_of_birth => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get surname => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PatientAddRequestCopyWith<PatientAddRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientAddRequestCopyWith<$Res> {
  factory $PatientAddRequestCopyWith(
          PatientAddRequest value, $Res Function(PatientAddRequest) then) =
      _$PatientAddRequestCopyWithImpl<$Res, PatientAddRequest>;
  @useResult
  $Res call(
      {String adress,
      String city,
      String date_of_birth,
      String id,
      String gender,
      String name,
      String surname});
}

/// @nodoc
class _$PatientAddRequestCopyWithImpl<$Res, $Val extends PatientAddRequest>
    implements $PatientAddRequestCopyWith<$Res> {
  _$PatientAddRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adress = null,
    Object? city = null,
    Object? date_of_birth = null,
    Object? id = null,
    Object? gender = null,
    Object? name = null,
    Object? surname = null,
  }) {
    return _then(_value.copyWith(
      adress: null == adress
          ? _value.adress
          : adress // ignore: cast_nullable_to_non_nullable
              as String,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PatientAddRequestCopyWith<$Res>
    implements $PatientAddRequestCopyWith<$Res> {
  factory _$$_PatientAddRequestCopyWith(_$_PatientAddRequest value,
          $Res Function(_$_PatientAddRequest) then) =
      __$$_PatientAddRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String adress,
      String city,
      String date_of_birth,
      String id,
      String gender,
      String name,
      String surname});
}

/// @nodoc
class __$$_PatientAddRequestCopyWithImpl<$Res>
    extends _$PatientAddRequestCopyWithImpl<$Res, _$_PatientAddRequest>
    implements _$$_PatientAddRequestCopyWith<$Res> {
  __$$_PatientAddRequestCopyWithImpl(
      _$_PatientAddRequest _value, $Res Function(_$_PatientAddRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adress = null,
    Object? city = null,
    Object? date_of_birth = null,
    Object? id = null,
    Object? gender = null,
    Object? name = null,
    Object? surname = null,
  }) {
    return _then(_$_PatientAddRequest(
      adress: null == adress
          ? _value.adress
          : adress // ignore: cast_nullable_to_non_nullable
              as String,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PatientAddRequest implements _PatientAddRequest {
  _$_PatientAddRequest(
      {this.adress = "",
      this.city = "",
      this.date_of_birth = "",
      this.id = "",
      this.gender = "",
      this.name = "",
      this.surname = ""});

  factory _$_PatientAddRequest.fromJson(Map<String, dynamic> json) =>
      _$$_PatientAddRequestFromJson(json);

  @override
  @JsonKey()
  final String adress;
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

  @override
  String toString() {
    return 'PatientAddRequest(adress: $adress, city: $city, date_of_birth: $date_of_birth, id: $id, gender: $gender, name: $name, surname: $surname)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PatientAddRequest &&
            (identical(other.adress, adress) || other.adress == adress) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.date_of_birth, date_of_birth) ||
                other.date_of_birth == date_of_birth) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.surname, surname) || other.surname == surname));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, adress, city, date_of_birth, id, gender, name, surname);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PatientAddRequestCopyWith<_$_PatientAddRequest> get copyWith =>
      __$$_PatientAddRequestCopyWithImpl<_$_PatientAddRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PatientAddRequestToJson(
      this,
    );
  }
}

abstract class _PatientAddRequest implements PatientAddRequest {
  factory _PatientAddRequest(
      {final String adress,
      final String city,
      final String date_of_birth,
      final String id,
      final String gender,
      final String name,
      final String surname}) = _$_PatientAddRequest;

  factory _PatientAddRequest.fromJson(Map<String, dynamic> json) =
      _$_PatientAddRequest.fromJson;

  @override
  String get adress;
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
  @JsonKey(ignore: true)
  _$$_PatientAddRequestCopyWith<_$_PatientAddRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
