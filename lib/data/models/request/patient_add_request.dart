import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_add_request.freezed.dart';
part 'patient_add_request.g.dart';

@freezed
class PatientAddRequest with _$PatientAddRequest {
  factory PatientAddRequest({
    @Default("") String address,
    @Default("") String city,
    @Default("") String date_of_birth,
    @Default("") String id,
    @Default("") String gender,
    @Default("") String name,
    @Default("") String surname,
  }) = _PatientAddRequest;

  factory PatientAddRequest.fromJson(Map<String, dynamic> json) =>
      _$PatientAddRequestFromJson(json);
}
