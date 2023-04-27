import 'package:care_mate/data/providers/repositories/firestore_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/enums/state_enum.dart';
import '../models/patient.dart';
import '../models/state/patient_add_state.dart';

class PatientUpdateNotifier extends StateNotifier<PatientState> {
  PatientUpdateNotifier(this.ref) : super(const PatientState());
  final Ref ref;

  void setAddress(String address) {
    state = state.copyWith(address: address);
  }

  void setSurname(String surname) {
    state = state.copyWith(surname: surname);
  }

  void setCity(String city) {
    state = state.copyWith(city: city);
  }

  void setInitialPatientData(Patient patient) {
    state = state.copyWith(
      address: patient.address,
      city: patient.city,
      date_of_birth: patient.date_of_birth,
      gender: patient.gender,
      name: patient.name,
      surname: patient.surname,
      id: patient.id,
    );
  }

  void clearAllFields() {
    setAddress('');
    setSurname('');
    setCity('');
  }

  void setInitialState() {
    state = state.copyWith(error: '', appState: AppState.initial);
  }

  Future<void> updatePatient() async {
    state = state.copyWith(appState: AppState.loading);
    try {
      await ref.read(firestoreRepositoryProvider).updatePatient(
            patient: Patient(
              address: state.address,
              city: state.city,
              date_of_birth: state.date_of_birth,
              gender: state.gender,
              name: state.name,
              surname: state.surname,
              id: state.id,
            ),
          );
    } catch (e) {
      print(e.toString());
      state = state.copyWith(appState: AppState.error, error: e.toString());
    }
    state = state.copyWith(appState: AppState.success);
    return;
  }
}

final patientUpdateProvider =
    StateNotifierProvider.autoDispose<PatientUpdateNotifier, PatientState>(
        (ref) {
  return PatientUpdateNotifier(ref);
});
