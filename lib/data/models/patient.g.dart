// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Patient _$$_PatientFromJson(Map<String, dynamic> json) => _$_Patient(
      address: json['address'] as String? ?? "",
      blood_pressures: (json['blood_pressures'] as List<dynamic>?)
              ?.map((e) => BloodPressure.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      city: json['city'] as String? ?? "",
      date_of_birth: json['date_of_birth'] as String? ?? "",
      id: json['id'] as String? ?? "",
      gender: json['gender'] as String? ?? "",
      name: json['name'] as String? ?? "",
      surname: json['surname'] as String? ?? "",
      temperatures: (json['temperatures'] as List<dynamic>?)
              ?.map((e) => Temperature.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_PatientToJson(_$_Patient instance) =>
    <String, dynamic>{
      'address': instance.address,
      'blood_pressures':
          instance.blood_pressures.map((e) => e.toJson()).toList(),
      'city': instance.city,
      'date_of_birth': instance.date_of_birth,
      'id': instance.id,
      'gender': instance.gender,
      'name': instance.name,
      'surname': instance.surname,
      'temperatures': instance.temperatures.map((e) => e.toJson()).toList(),
    };

_$_BloodPressure _$$_BloodPressureFromJson(Map<String, dynamic> json) =>
    _$_BloodPressure(
      diastolic: json['diastolic'] as String? ?? "",
      systolic: json['systolic'] as String? ?? "",
      measurement_time: json['measurement_time'] as String? ?? "",
    );

Map<String, dynamic> _$$_BloodPressureToJson(_$_BloodPressure instance) =>
    <String, dynamic>{
      'diastolic': instance.diastolic,
      'systolic': instance.systolic,
      'measurement_time': instance.measurement_time,
    };

_$_Temperature _$$_TemperatureFromJson(Map<String, dynamic> json) =>
    _$_Temperature(
      measurement_value: json['measurement_value'] as String? ?? "",
      measurement_time: json['measurement_time'] as String? ?? "",
    );

Map<String, dynamic> _$$_TemperatureToJson(_$_Temperature instance) =>
    <String, dynamic>{
      'measurement_value': instance.measurement_value,
      'measurement_time': instance.measurement_time,
    };
