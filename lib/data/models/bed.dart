import 'package:freezed_annotation/freezed_annotation.dart';

part 'bed.freezed.dart';
part 'bed.g.dart';

@freezed
class Bed with _$Bed {
  const factory Bed({
    @Default("") String id,
    @Default("") String name,
    @JsonKey(name: "patient_id") @Default("") String patientId,
    @JsonKey(name: "room_id") @Default("") String roomId,
    @JsonKey(name: "nfc_uid") @Default("") String nfcUid,
  }) = _Bed;

  factory Bed.fromJson(Map<String, dynamic> json) => _$BedFromJson(json);
}
