// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Bed _$BedFromJson(Map<String, dynamic> json) {
  return _Bed.fromJson(json);
}

/// @nodoc
mixin _$Bed {
  @JsonKey(name: "floor_id")
  String get floorId => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "patient_id")
  String get patientId => throw _privateConstructorUsedError;
  @JsonKey(name: "room_id")
  String get roomId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BedCopyWith<Bed> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BedCopyWith<$Res> {
  factory $BedCopyWith(Bed value, $Res Function(Bed) then) =
      _$BedCopyWithImpl<$Res, Bed>;
  @useResult
  $Res call(
      {@JsonKey(name: "floor_id") String floorId,
      String id,
      String name,
      @JsonKey(name: "patient_id") String patientId,
      @JsonKey(name: "room_id") String roomId});
}

/// @nodoc
class _$BedCopyWithImpl<$Res, $Val extends Bed> implements $BedCopyWith<$Res> {
  _$BedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? floorId = null,
    Object? id = null,
    Object? name = null,
    Object? patientId = null,
    Object? roomId = null,
  }) {
    return _then(_value.copyWith(
      floorId: null == floorId
          ? _value.floorId
          : floorId // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BedCopyWith<$Res> implements $BedCopyWith<$Res> {
  factory _$$_BedCopyWith(_$_Bed value, $Res Function(_$_Bed) then) =
      __$$_BedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "floor_id") String floorId,
      String id,
      String name,
      @JsonKey(name: "patient_id") String patientId,
      @JsonKey(name: "room_id") String roomId});
}

/// @nodoc
class __$$_BedCopyWithImpl<$Res> extends _$BedCopyWithImpl<$Res, _$_Bed>
    implements _$$_BedCopyWith<$Res> {
  __$$_BedCopyWithImpl(_$_Bed _value, $Res Function(_$_Bed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? floorId = null,
    Object? id = null,
    Object? name = null,
    Object? patientId = null,
    Object? roomId = null,
  }) {
    return _then(_$_Bed(
      floorId: null == floorId
          ? _value.floorId
          : floorId // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Bed implements _Bed {
  const _$_Bed(
      {@JsonKey(name: "floor_id") this.floorId = "",
      this.id = "",
      this.name = "",
      @JsonKey(name: "patient_id") this.patientId = "",
      @JsonKey(name: "room_id") this.roomId = ""});

  factory _$_Bed.fromJson(Map<String, dynamic> json) => _$$_BedFromJson(json);

  @override
  @JsonKey(name: "floor_id")
  final String floorId;
  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey(name: "patient_id")
  final String patientId;
  @override
  @JsonKey(name: "room_id")
  final String roomId;

  @override
  String toString() {
    return 'Bed(floorId: $floorId, id: $id, name: $name, patientId: $patientId, roomId: $roomId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Bed &&
            (identical(other.floorId, floorId) || other.floorId == floorId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.roomId, roomId) || other.roomId == roomId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, floorId, id, name, patientId, roomId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BedCopyWith<_$_Bed> get copyWith =>
      __$$_BedCopyWithImpl<_$_Bed>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BedToJson(
      this,
    );
  }
}

abstract class _Bed implements Bed {
  const factory _Bed(
      {@JsonKey(name: "floor_id") final String floorId,
      final String id,
      final String name,
      @JsonKey(name: "patient_id") final String patientId,
      @JsonKey(name: "room_id") final String roomId}) = _$_Bed;

  factory _Bed.fromJson(Map<String, dynamic> json) = _$_Bed.fromJson;

  @override
  @JsonKey(name: "floor_id")
  String get floorId;
  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(name: "patient_id")
  String get patientId;
  @override
  @JsonKey(name: "room_id")
  String get roomId;
  @override
  @JsonKey(ignore: true)
  _$$_BedCopyWith<_$_Bed> get copyWith => throw _privateConstructorUsedError;
}