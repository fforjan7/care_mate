import 'package:freezed_annotation/freezed_annotation.dart';

part 'bed.freezed.dart';
part 'bed.g.dart';

@freezed
class Bed with _$Bed {
  const factory Bed({
    @Default("") String name,
    @Default("") String patientId,
  }) = _Bed;

  factory Bed.fromJson(Map<String, dynamic> json) => _$BedFromJson(json);
}
