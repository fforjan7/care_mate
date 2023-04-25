import 'package:freezed_annotation/freezed_annotation.dart';

part 'bed.freezed.dart';
part 'bed.g.dart';

@freezed
class Bed with _$Bed {
  const factory Bed({
    @JsonKey(name: "floor_id") @Default("") String floorId,
    @Default("") String id,
    @Default("") String name,
    @JsonKey(name: "patient_id") @Default("") String patientId,
    @JsonKey(name: "room_id") @Default("") String roomId,
  }) = _Bed;

  factory Bed.fromJson(Map<String, dynamic> json) => _$BedFromJson(json);
}
