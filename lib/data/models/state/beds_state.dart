import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:care_mate/common/enums/state_enum.dart';

part 'beds_state.freezed.dart';

@freezed
class BedsState with _$BedsState {
  const factory BedsState({
    @Default("") String name,
    @Default(AppState.initial) AppState appState,
    @Default("") String error,
  }) = _BedsState;
}
