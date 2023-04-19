import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:care_mate/common/enums/state_enum.dart';

part 'patient_state.freezed.dart';

@freezed
class PatientState with _$PatientState {
  const factory PatientState({
    @Default("") String address,
    @Default("") String city,
    @Default("") String date_of_birth,
    @Default("") String gender,
    @Default("") String name,
    @Default("") String surname,
    @Default(AppState.initial) AppState appState,
    @Default("") String error,
  }) = _PatientState;
}
