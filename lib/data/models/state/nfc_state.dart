import 'package:care_mate/data/models/bed.dart';
import 'package:care_mate/data/models/patient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:care_mate/common/enums/state_enum.dart';

part 'nfc_state.freezed.dart';

@freezed
class NfcState with _$NfcState {
  const factory NfcState({
    @Default("") String nfcId,
    @Default(Bed()) Bed bed,
    @Default(Patient()) Patient patient,
    @Default(AppState.initial) AppState appState,
    @Default("") String error,
  }) = _NfcState;
}
