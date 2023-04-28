import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:care_mate/common/enums/state_enum.dart';

import '../patient.dart';

part 'tabs_state.freezed.dart';

@freezed
class TabsState with _$TabsState {
  const factory TabsState({
    //patient details tab
    @Default("") String address,
    @Default("") String city,
    @Default("") String dateOfBirth,
    @Default("") String id,
    @Default("") String gender,
    @Default("") String name,
    @Default("") String surname,
    //patient temperatures tab
    @Default("") String temperatureValue,
    @Default("") String temperatureMeasurementTime,
    @Default([]) List<Temperature> temperatures,
    //patient blood pressure tab
    @Default("") String diastolicValue,
    @Default("") String systolicValue,
    @Default("") String bloodPressureMeasurementTime,
    @Default([]) List<BloodPressure> bloodPressures,
    //state
    @Default(AppState.initial) AppState appState,
    @Default("") String error,
  }) = _TabsState;
}
