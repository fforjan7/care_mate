// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PatientRequest _$$_PatientRequestFromJson(Map<String, dynamic> json) =>
    _$_PatientRequest(
      address: json['address'] as String? ?? "",
      age: json['age'] as String? ?? "",
      disease: json['disease'] as String? ?? "",
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      surname: json['surname'] as String? ?? "",
    );

Map<String, dynamic> _$$_PatientRequestToJson(_$_PatientRequest instance) =>
    <String, dynamic>{
      'address': instance.address,
      'age': instance.age,
      'disease': instance.disease,
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
    };
