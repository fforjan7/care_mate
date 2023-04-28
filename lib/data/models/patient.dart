import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient.freezed.dart';
part 'patient.g.dart';

@freezed
class Patient with _$Patient {
  const factory Patient({
    @Default("") String address,
    @Default([]) List<BloodPressure> blood_pressures,
    @Default("") String city,
    @Default("") String date_of_birth,
    @Default("") String id,
    @Default("") String gender,
    @Default("") String name,
    @Default("") String surname,
    @Default([]) List<Temperature> temperatures,
  }) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);
}

@JsonSerializable()
class BloodPressure {
  final String diastolic;
  final String systolic;
  final String measurement_time;

  BloodPressure({
    required this.diastolic,
    required this.systolic,
    required this.measurement_time,
  });

  factory BloodPressure.fromJson(Map<String, dynamic> json) =>
      _$BloodPressureFromJson(json);

  Map<String, dynamic> toJson() => _$BloodPressureToJson(this);
}

@JsonSerializable()
class Temperature {
  final String measurement_value;
  final String measurement_time;

  Temperature({
    required this.measurement_value,
    required this.measurement_time,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);

  Map<String, dynamic> toJson() => _$TemperatureToJson(this);
}
