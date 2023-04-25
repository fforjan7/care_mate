import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:care_mate/common/enums/state_enum.dart';

part 'floors_state.freezed.dart';

@freezed
class FloorsState with _$FloorsState {
  const factory FloorsState({
    @Default("") String name,
    @Default(AppState.initial) AppState appState,
    @Default("") String error,
  }) = _FloorsState;
}
