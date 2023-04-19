// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_add_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PatientAddRequest _$$_PatientAddRequestFromJson(Map<String, dynamic> json) =>
    _$_PatientAddRequest(
      address: json['address'] as String? ?? "",
      city: json['city'] as String? ?? "",
      date_of_birth: json['date_of_birth'] as String? ?? "",
      id: json['id'] as String? ?? "",
      gender: json['gender'] as String? ?? "",
      name: json['name'] as String? ?? "",
      surname: json['surname'] as String? ?? "",
    );

Map<String, dynamic> _$$_PatientAddRequestToJson(
        _$_PatientAddRequest instance) =>
    <String, dynamic>{
      'address': instance.address,
      'city': instance.city,
      'date_of_birth': instance.date_of_birth,
      'id': instance.id,
      'gender': instance.gender,
      'name': instance.name,
      'surname': instance.surname,
    };
