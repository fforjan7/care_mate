import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_request.freezed.dart';
part 'patient_request.g.dart';

@freezed
class PatientRequest with _$PatientRequest {
  factory PatientRequest({
    @Default("") String address,
    @Default("") String age,
    @Default("") String disease,
    @Default("") String id,
    @Default("") String name,
    @Default("") String surname,
  }) = _PatientRequest;

  factory PatientRequest.fromJson(Map<String, dynamic> json) =>
      _$PatientRequestFromJson(json);
}
