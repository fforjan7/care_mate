import 'package:care_mate/data/models/request/patient_add_request.dart';
import 'package:care_mate/data/providers/firestore/firestore_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/enums/state_enum.dart';
import '../../models/state/patient_add_state.dart';

class PatientAddNotifier extends StateNotifier<PatientAddState> {
  PatientAddNotifier(this.ref) : super(const PatientAddState());
  final Ref ref;

  void setAddress(String address) {
    state = state.copyWith(address: address);
  }

  void setDateOfBirth(String dateOfBirth) {
    state = state.copyWith(date_of_birth: dateOfBirth);
  }

  void setGender(String gender) {
    state = state.copyWith(gender: gender);
  }

  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void setSurname(String surname) {
    state = state.copyWith(surname: surname);
  }

  void setCity(String city) {
    state = state.copyWith(city: city);
  }

  void clearAllFields() {
    setAddress('');
    setDateOfBirth('');
    setGender('');
    setName('');
    setSurname('');
    setCity('');
  }

  void setInitialState() {
    state = state.copyWith(error: '', appState: AppState.initial);
  }

  Future<void> patientAdd() async {
    state = state.copyWith(appState: AppState.loading);
    try {
      print("IME: ${state.name}");
      await ref.read(firestoreRepositoryProvider).addPatient(
              patient: PatientAddRequest(
            address: state.address,
            city: state.city,
            date_of_birth: state.date_of_birth,
            gender: state.gender,
            name: state.name,
            surname: state.surname,
          ));
    } catch (e) {
      print(e.toString());
      state = state.copyWith(appState: AppState.error, error: e.toString());
    }
    state = state.copyWith(appState: AppState.success);
    return;
  }
}

final patientAddProvider =
    StateNotifierProvider<PatientAddNotifier, PatientAddState>((ref) {
  return PatientAddNotifier(ref);
});
