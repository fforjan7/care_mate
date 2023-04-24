import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:care_mate/common/enums/state_enum.dart';

import '../patient.dart';

part 'patient_get_state.freezed.dart';

@freezed
class PatientGetState with _$PatientGetState {
  const factory PatientGetState({
    @Default([]) List<Patient> patients,
    @Default(AppState.initial) AppState appState,
    @Default("") String error,
  }) = _PatientGetState;
}
