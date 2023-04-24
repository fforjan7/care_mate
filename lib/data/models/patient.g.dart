// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BloodPressure _$BloodPressureFromJson(Map<String, dynamic> json) =>
    BloodPressure(
      diastolic: json['diastolic'] as int,
      systolic: json['systolic'] as int,
      measurement_time: json['measurement_time'] as String,
    );

Map<String, dynamic> _$BloodPressureToJson(BloodPressure instance) =>
    <String, dynamic>{
      'diastolic': instance.diastolic,
      'systolic': instance.systolic,
      'measurement_time': instance.measurement_time,
    };

Temperature _$TemperatureFromJson(Map<String, dynamic> json) => Temperature(
      measurement_value: (json['measurement_value'] as num).toDouble(),
      measurement_time: json['measurement_time'] as String,
    );

Map<String, dynamic> _$TemperatureToJson(Temperature instance) =>
    <String, dynamic>{
      'measurement_value': instance.measurement_value,
      'measurement_time': instance.measurement_time,
    };

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
      'blood_pressures': instance.blood_pressures,
      'city': instance.city,
      'date_of_birth': instance.date_of_birth,
      'id': instance.id,
      'gender': instance.gender,
      'name': instance.name,
      'surname': instance.surname,
      'temperatures': instance.temperatures,
    };
