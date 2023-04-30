import 'package:care_mate/data/models/state/tabs_state.dart';
import 'package:care_mate/data/providers/repositories/firestore_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../common/enums/state_enum.dart';
import '../models/bed.dart';
import '../models/patient.dart';
import 'initial_patient_provider.dart';

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

  void setTemperatureValue(String value) {
    state = state.copyWith(temperatureValue: value);
  }

  void setTemperatureMeasurementTime(String time) {
    state = state.copyWith(temperatureMeasurementTime: time);
  }

  void setSystolicValue(String value) {
    state = state.copyWith(systolicValue: value);
  }

  void setDiastlicValue(String value) {
    state = state.copyWith(diastolicValue: value);
  }

  void setBloodPressureMeasurementTime(String time) {
    state = state.copyWith(bloodPressureMeasurementTime: time);
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
    Patient currentPatient = getCurrentPatientData();
    return (patient.id != currentPatient.id) ||
        (patient.name != currentPatient.name) ||
        (patient.surname != currentPatient.surname) ||
        (patient.date_of_birth != currentPatient.date_of_birth) ||
        (patient.gender != currentPatient.gender) ||
        (patient.address != currentPatient.address) ||
        (patient.city != currentPatient.city);
  }

  void setInitialState() {
    state = state.copyWith(error: '', appState: AppState.initial);
  }

  Future<void> updatePatientData() async {
    state = state.copyWith(appState: AppState.loading);
    try {
      await ref
          .read(firestoreRepositoryProvider)
          .updatePatient(patient: getCurrentPatientData());
      //update initalPatientProvider to disable button (comparison value)
      ref.read(initialPatientProvider.notifier).state =
          ref.read(tabsProvider.notifier).getCurrentPatientData();
    } catch (e) {
      state = state.copyWith(appState: AppState.error, error: e.toString());
    }
    state = state.copyWith(appState: AppState.success);
    return;
  }

  Future<void> addTemperatureMeasurement() async {
    state = state.copyWith(appState: AppState.loading);
    try {
      Temperature temperature = Temperature(
        measurement_value: state.temperatureValue,
        measurement_time: state.temperatureMeasurementTime,
      );

      List<Temperature> updatedTemperatures =
          List<Temperature>.from(state.temperatures)..add(temperature);

      updatedTemperatures.sort((a, b) {
        DateTime time1 =
            DateFormat('dd/MM/yyyy HH:mm').parse(a.measurement_time);
        DateTime time2 =
            DateFormat('dd/MM/yyyy HH:mm').parse(b.measurement_time);
        return time2.compareTo(time1);
      });

      state = state.copyWith(temperatures: updatedTemperatures);

      await ref
          .read(firestoreRepositoryProvider)
          .addTemperatureMeasurement(patient: getCurrentPatientData());
    } catch (e) {
      state = state.copyWith(appState: AppState.error, error: e.toString());
    }
    state = state.copyWith(appState: AppState.success);
    return;
  }

  Future<void> addBloodPressureMeasurement() async {
    state = state.copyWith(appState: AppState.loading);
    try {
      BloodPressure bloodPressure = BloodPressure(
        diastolic: state.diastolicValue,
        systolic: state.systolicValue,
        measurement_time: state.bloodPressureMeasurementTime,
      );

      List<BloodPressure> updatedBloodPressures =
          List<BloodPressure>.from(state.bloodPressures)..add(bloodPressure);

      updatedBloodPressures.sort((a, b) {
        DateTime time1 =
            DateFormat('dd/MM/yyyy HH:mm').parse(a.measurement_time);
        DateTime time2 =
            DateFormat('dd/MM/yyyy HH:mm').parse(b.measurement_time);
        return time2.compareTo(time1);
      });

      state = state.copyWith(bloodPressures: updatedBloodPressures);

      await ref
          .read(firestoreRepositoryProvider)
          .addBloodPressureMeasurement(patient: getCurrentPatientData());
    } catch (e) {
      state = state.copyWith(appState: AppState.error, error: e.toString());
    }
    state = state.copyWith(appState: AppState.success);
    return;
  }

  Future<Bed?> getPatientsBed() async {
    List<Bed> beds = [];
    state = state.copyWith(appState: AppState.loading);
    try {
      beds = await ref.read(firestoreRepositoryProvider).getBeds();
    } catch (e) {
      state = state.copyWith(appState: AppState.error, error: e.toString());
    }
    state = state.copyWith(appState: AppState.initial);
    for (var bed in beds) {
      if (bed.patientId == state.id) {
        return bed;
      }
    }
    return null;
  }

  Future<void> removePatientFromBed({
    required Bed bed,
  }) async {
    state = state.copyWith(appState: AppState.loading);
    try {
      Bed updatedBed = bed.copyWith(patientId: '');
      await ref.read(firestoreRepositoryProvider).updateBed(bed: updatedBed);
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
