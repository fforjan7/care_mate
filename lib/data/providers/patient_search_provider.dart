import 'package:care_mate/common/enums/state_enum.dart';
import 'package:care_mate/data/models/state/patient_search_state.dart';
import 'package:care_mate/data/providers/repositories/firestore_repository_provider.dart';
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

  Future<void> getPatients() async {
    state = state.copyWith(appState: AppState.loading);
    try {
      List<Patient> patients =
          await ref.read(firestoreRepositoryProvider).getPatients();
      state = state.copyWith(patients: patients);
      print("PATIENTS:${state.patients}");
    } catch (e) {
      print(e.toString());
      state = state.copyWith(appState: AppState.error, error: e.toString());
    }
    state = state.copyWith(appState: AppState.success);
    return;
  }

  void setInitialState() {
    state = state.copyWith(error: '', appState: AppState.initial);
  }
}

final patientSearchProvider =
    StateNotifierProvider<PatientSearchNotifier, PatientSearchState>((ref) {
  return PatientSearchNotifier(ref);
});
