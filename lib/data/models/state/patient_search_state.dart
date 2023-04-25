import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:care_mate/common/enums/state_enum.dart';

import '../patient.dart';

part 'patient_search_state.freezed.dart';

@freezed
class PatientSearchState with _$PatientSearchState {
  const factory PatientSearchState({
    @Default("") String searchInput,
    @Default(AppState.initial) AppState appState,
    @Default("") String error,
  }) = _PatientSearchState;
}
