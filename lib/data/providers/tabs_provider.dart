import 'package:care_mate/data/models/state/tabs_state.dart';
import 'package:care_mate/data/providers/repositories/firestore_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/enums/state_enum.dart';
import '../models/patient.dart';

class TabsNotifier extends StateNotifier<TabsState> {
  TabsNotifier(this.ref) : super(const TabsState());
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
      dateOfBirth: patient.date_of_birth,
      gender: patient.gender,
      name: patient.name,
      surname: patient.surname,
      id: patient.id,
      bloodPressures: patient.blood_pressures,
      temperatures: patient.temperatures,
      appState: AppState.initial,
      error: "",
    );
  }

  Patient getCurrentPatientData() {
    return Patient(
      address: state.address,
      city: state.city,
      date_of_birth: state.dateOfBirth,
      gender: state.gender,
      name: state.name,
      surname: state.surname,
      id: state.id,
      blood_pressures: state.bloodPressures,
      temperatures: state.temperatures,
    );
  }

  bool isPatientDataChanged({required Patient patient}) {
    print(patient != getCurrentPatientData());
    return patient != getCurrentPatientData();
  }

  void setInitialState() {
    state = state.copyWith(error: '', appState: AppState.initial);
  }

  Future<void> updatePatientData() async {
    state = state.copyWith(appState: AppState.loading);
    try {
      await ref.read(firestoreRepositoryProvider).updatePatient(
            patient: Patient(
              address: state.address,
              city: state.city,
              date_of_birth: state.dateOfBirth,
              gender: state.gender,
              name: state.name,
              surname: state.surname,
              id: state.id,
            ),
          );
    } catch (e) {
      state = state.copyWith(appState: AppState.error, error: e.toString());
    }
    state = state.copyWith(appState: AppState.success);
    return;
  }
}

final tabsProvider = StateNotifierProvider<TabsNotifier, TabsState>((ref) {
  return TabsNotifier(ref);
});
