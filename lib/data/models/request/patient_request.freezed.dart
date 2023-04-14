// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PatientRequest _$PatientRequestFromJson(Map<String, dynamic> json) {
  return _PatientRequest.fromJson(json);
}

/// @nodoc
mixin _$PatientRequest {
  String get address => throw _privateConstructorUsedError;
  String get age => throw _privateConstructorUsedError;
  String get disease => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get surname => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PatientRequestCopyWith<PatientRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientRequestCopyWith<$Res> {
  factory $PatientRequestCopyWith(
          PatientRequest value, $Res Function(PatientRequest) then) =
      _$PatientRequestCopyWithImpl<$Res, PatientRequest>;
  @useResult
  $Res call(
      {String address,
      String age,
      String disease,
      String id,
      String name,
      String surname});
}

/// @nodoc
class _$PatientRequestCopyWithImpl<$Res, $Val extends PatientRequest>
    implements $PatientRequestCopyWith<$Res> {
  _$PatientRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? age = null,
    Object? disease = null,
    Object? id = null,
    Object? name = null,
    Object? surname = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      disease: null == disease
          ? _value.disease
          : disease // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_PatientRequestCopyWith<$Res>
    implements $PatientRequestCopyWith<$Res> {
  factory _$$_PatientRequestCopyWith(
          _$_PatientRequest value, $Res Function(_$_PatientRequest) then) =
      __$$_PatientRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String address,
      String age,
      String disease,
      String id,
      String name,
      String surname});
}

/// @nodoc
class __$$_PatientRequestCopyWithImpl<$Res>
    extends _$PatientRequestCopyWithImpl<$Res, _$_PatientRequest>
    implements _$$_PatientRequestCopyWith<$Res> {
  __$$_PatientRequestCopyWithImpl(
      _$_PatientRequest _value, $Res Function(_$_PatientRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? age = null,
    Object? disease = null,
    Object? id = null,
    Object? name = null,
    Object? surname = null,
  }) {
    return _then(_$_PatientRequest(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      disease: null == disease
          ? _value.disease
          : disease // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
class _$_PatientRequest implements _PatientRequest {
  _$_PatientRequest(
      {this.address = "",
      this.age = "",
      this.disease = "",
      this.id = "",
      this.name = "",
      this.surname = ""});

  factory _$_PatientRequest.fromJson(Map<String, dynamic> json) =>
      _$$_PatientRequestFromJson(json);

  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final String age;
  @override
  @JsonKey()
  final String disease;
  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String surname;

  @override
  String toString() {
    return 'PatientRequest(address: $address, age: $age, disease: $disease, id: $id, name: $name, surname: $surname)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PatientRequest &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.disease, disease) || other.disease == disease) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.surname, surname) || other.surname == surname));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, address, age, disease, id, name, surname);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PatientRequestCopyWith<_$_PatientRequest> get copyWith =>
      __$$_PatientRequestCopyWithImpl<_$_PatientRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PatientRequestToJson(
      this,
    );
  }
}

abstract class _PatientRequest implements PatientRequest {
  factory _PatientRequest(
      {final String address,
      final String age,
      final String disease,
      final String id,
      final String name,
      final String surname}) = _$_PatientRequest;

  factory _PatientRequest.fromJson(Map<String, dynamic> json) =
      _$_PatientRequest.fromJson;

  @override
  String get address;
  @override
  String get age;
  @override
  String get disease;
  @override
  String get id;
  @override
  String get name;
  @override
  String get surname;
  @override
  @JsonKey(ignore: true)
  _$$_PatientRequestCopyWith<_$_PatientRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
