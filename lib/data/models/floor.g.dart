// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Floor _$$_FloorFromJson(Map<String, dynamic> json) => _$_Floor(
      name: json['name'] as String? ?? "",
      rooms: (json['rooms'] as List<dynamic>?)
              ?.map((e) => Room.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_FloorToJson(_$_Floor instance) => <String, dynamic>{
      'name': instance.name,
      'rooms': instance.rooms,
    };
