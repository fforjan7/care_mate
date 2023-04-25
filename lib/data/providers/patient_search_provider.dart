import 'package:care_mate/common/enums/state_enum.dart';
import 'package:care_mate/data/models/state/patient_search_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PatientSearchNotifier extends StateNotifier<PatientSearchState> {
  PatientSearchNotifier(this.ref) : super(const PatientSearchState());
  final Ref ref;

  void setSearchInput(String searchInput) {
    state = state.copyWith(searchInput: searchInput);
  }

  void clearSearchInput() {
    state = state.copyWith(searchInput: '');
  }

  void setInitialState() {
    state = state.copyWith(error: '', appState: AppState.initial);
  }
}

final patientSearchProvider =
    StateNotifierProvider<PatientSearchNotifier, PatientSearchState>((ref) {
  return PatientSearchNotifier(ref);
});
