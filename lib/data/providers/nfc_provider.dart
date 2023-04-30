import 'package:care_mate/data/providers/repositories/firestore_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/enums/state_enum.dart';
import '../models/bed.dart';
import '../models/patient.dart';
import '../models/state/nfc_state.dart';

class NfcNotifier extends StateNotifier<NfcState> {
  NfcNotifier(this.ref) : super(const NfcState());

  final Ref ref;

  void setId(String id) {
    state = state.copyWith(nfcId: id);
  }

  void setInitialState() {
    state = state.copyWith(error: '', appState: AppState.initial);
  }

  Future<Bed?> getBedByNfcId() async {
    Bed? bed;
    state = state.copyWith(appState: AppState.loading);
    try {
      bed = await ref
          .read(firestoreRepositoryProvider)
          .getBedByNfcId(nfcId: state.nfcId);
      if (bed != null) {
        state = state.copyWith(bed: bed);
      }
    } catch (e) {
      state = state.copyWith(appState: AppState.error, error: e.toString());
    }
    state = state.copyWith(appState: AppState.initial);
    return bed;
  }

  Future<Patient?> getPatientByBed({required Bed bed}) async {
    Patient? patient;
    state = state.copyWith(appState: AppState.loading);
    try {
      patient = await ref
          .read(firestoreRepositoryProvider)
          .getPatientByBed(patientId: bed.patientId);
      if (patient != null) {
        state = state.copyWith(patient: patient);
      }
    } catch (e) {
      state = state.copyWith(appState: AppState.error, error: e.toString());
    }
    state = state.copyWith(appState: AppState.success);
    return patient;
  }
}

final nfcProvider =
    StateNotifierProvider.autoDispose<NfcNotifier, NfcState>((ref) {
  return NfcNotifier(ref);
});
