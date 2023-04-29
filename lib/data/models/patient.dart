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

@freezed
class BloodPressure with _$BloodPressure {
  const factory BloodPressure({
    @Default("") String diastolic,
    @Default("") String systolic,
    @Default("") String measurement_time,
  }) = _BloodPressure;

  factory BloodPressure.fromJson(Map<String, dynamic> json) =>
      _$BloodPressureFromJson(json);
}

@freezed
class Temperature with _$Temperature {
  const factory Temperature({
    @Default("") String measurement_value,
    @Default("") String measurement_time,
  }) = _Temperature;

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);
}
