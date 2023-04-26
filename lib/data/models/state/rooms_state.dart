import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:care_mate/common/enums/state_enum.dart';

part 'rooms_state.freezed.dart';

@freezed
class RoomsState with _$RoomsState {
  const factory RoomsState({
    @Default("") String name,
    @Default(AppState.initial) AppState appState,
    @Default("") String error,
  }) = _RoomsState;
}
