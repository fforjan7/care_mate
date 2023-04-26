import 'package:care_mate/common/enums/state_enum.dart';
import 'package:care_mate/data/models/state/patient_search_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/patient.dart';

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

  List<Patient> filterPatients({required List<Patient> patients}) {
    final String lowerCasedSearchInput = state.searchInput.toLowerCase();
    return patients
        .where((patient) =>
            patient.name.toLowerCase().contains(lowerCasedSearchInput) ||
            patient.surname.toLowerCase().contains(lowerCasedSearchInput))
        .toList();
  }
}

final patientSearchProvider = StateNotifierProvider.autoDispose<
    PatientSearchNotifier, PatientSearchState>((ref) {
  return PatientSearchNotifier(ref);
});
