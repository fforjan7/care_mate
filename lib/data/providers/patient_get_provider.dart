import 'package:care_mate/common/enums/state_enum.dart';

import 'package:care_mate/data/providers/repositories/firestore_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/patient.dart';
import '../models/state/patient_get_state.dart';

class PatientGetNotifier extends StateNotifier<PatientGetState> {
  PatientGetNotifier(this.ref) : super(const PatientGetState());
  final Ref ref;

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

final patientGetProvider =
    StateNotifierProvider<PatientGetNotifier, PatientGetState>((ref) {
  return PatientGetNotifier(ref);
});
