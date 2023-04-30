import 'package:care_mate/common/enums/state_enum.dart';
import 'package:care_mate/data/models/state/patient_search_state.dart';
import 'package:care_mate/data/providers/repositories/firestore_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/bed.dart';
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

  Future<List<Bed>> getBeds() async {
    List<Bed> beds = [];
    state = state.copyWith(appState: AppState.loading);
    try {
      beds = await ref.read(firestoreRepositoryProvider).getBeds();
    } catch (e) {
      state = state.copyWith(appState: AppState.error, error: e.toString());
    }
    state = state.copyWith(appState: AppState.initial);
    return beds;
  }

  Future<void> connectPatientToBed({
    required Bed bed,
    required Patient patient,
  }) async {
    state = state.copyWith(appState: AppState.loading);
    try {
      Bed updatedBed = bed.copyWith(patientId: patient.id);

      await ref.read(firestoreRepositoryProvider).updateBed(bed: updatedBed);
    } catch (e) {
      state = state.copyWith(appState: AppState.error, error: e.toString());
    }
    state = state.copyWith(appState: AppState.success);
    return;
  }
}

final patientSearchProvider = StateNotifierProvider.autoDispose<
    PatientSearchNotifier, PatientSearchState>((ref) {
  return PatientSearchNotifier(ref);
});
