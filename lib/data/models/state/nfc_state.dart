import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:care_mate/common/enums/state_enum.dart';

part 'nfc_state.freezed.dart';

@freezed
class NfcState with _$NfcState {
  const factory NfcState({
    @Default("") String id,
    @Default(AppState.initial) AppState appState,
    @Default("") String error,
  }) = _NfcState;
}
