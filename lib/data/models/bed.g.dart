// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Bed _$$_BedFromJson(Map<String, dynamic> json) => _$_Bed(
      floorId: json['floor_id'] as String? ?? "",
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      patientId: json['patient_id'] as String? ?? "",
      roomId: json['room_id'] as String? ?? "",
    );

Map<String, dynamic> _$$_BedToJson(_$_Bed instance) => <String, dynamic>{
      'floor_id': instance.floorId,
      'id': instance.id,
      'name': instance.name,
      'patient_id': instance.patientId,
      'room_id': instance.roomId,
    };