import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:care_mate/common/enums/state_enum.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(false) bool isAdmin,
    @Default(AppState.initial) AppState appState,
    @Default("") String error,
  }) = _UserState;
}
